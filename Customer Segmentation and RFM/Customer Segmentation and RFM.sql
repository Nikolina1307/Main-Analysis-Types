-- Compute for F and M
WITH FM_table AS (
    SELECT
        CustomerID,
        MAX(DATE_TRUNC(InvoiceDate, DAY)) AS last_purchase_date,
        COUNT(DISTINCT InvoiceNo) AS frequency,
        ROUND(SUM(Quantity * UnitPrice), 2) AS monetary
    FROM
        `turing_data_analytics.rfm`
    WHERE
        DATE_TRUNC(InvoiceDate, DAY) BETWEEN '2010-12-01' AND '2011-12-01'
        AND Quantity > 0
        AND UnitPrice > 0
        AND CustomerID IS NOT NULL
    GROUP BY
        CustomerID
),

-- Compute for R
R_table AS (
    SELECT
        CustomerID,
        frequency,
        monetary,
        DATE_DIFF(reference_date, last_purchase_date, DAY) AS recency
    FROM
    (
        SELECT
            *,
            MAX(last_purchase_date) OVER () AS reference_date
        FROM
            FM_table
    )
),

-- Determine quartiles for R, F, and M
quartiles AS (
    SELECT
        R_table.*,
        -- All Recency Quartiles
        R_percentiles.percentiles[offset(25)] AS r25,
        R_percentiles.percentiles[offset(50)] AS r50,
        R_percentiles.percentiles[offset(75)] AS r75,
        R_percentiles.percentiles[offset(100)] AS r100,
        -- all Frequency Quartiles
        F_percentiles.percentiles[offset(25)] AS f25,
        F_percentiles.percentiles[offset(50)] AS f50,
        F_percentiles.percentiles[offset(75)] AS f75,
        F_percentiles.percentiles[offset(100)] AS f100,
        -- All Monetary Quartiles
        M_percentiles.percentiles[offset(25)] AS m25,
        M_percentiles.percentiles[offset(50)] AS m50,
        M_percentiles.percentiles[offset(75)] AS m75,
        M_percentiles.percentiles[offset(100)] AS m100
    FROM
        R_table,
        (SELECT APPROX_QUANTILES(recency, 100) AS percentiles FROM R_table) AS R_percentiles,
        (SELECT APPROX_QUANTILES(frequency, 100) AS percentiles FROM R_table) AS F_percentiles,
        (SELECT APPROX_QUANTILES(monetary, 100) AS percentiles FROM R_table) AS M_percentiles
),

-- Assign scores for R, F, and M
RFM_scores AS (
    SELECT
        *,
        CASE
            WHEN monetary <= m25 THEN 1
            WHEN monetary <= m50 AND monetary > m25 THEN 2
            WHEN monetary <= m75 AND monetary > m50 THEN 3
            WHEN monetary <= m100 AND monetary > m75 THEN 4
        END AS m_score,
        CASE
            WHEN frequency <= f25 THEN 1
            WHEN frequency <= f50 AND frequency > f25 THEN 2
            WHEN frequency <= f75 AND frequency > f50 THEN 3
            WHEN frequency <= f100 AND frequency > f75 THEN 4
        END AS f_score,
        CASE
            WHEN recency <= r25 THEN 4
            WHEN recency <= r50 AND recency > r25 THEN 3
            WHEN recency <= r75 AND recency > r50 THEN 2
            WHEN recency <= r100 AND recency > r75 THEN 1
        END AS r_score
    FROM
        quartiles
),

-- Define RFM segments
RFM_segments AS (
    SELECT
        CustomerID,
        recency,
        frequency,
        monetary,
        r_score,
        f_score,
        m_score,
        CASE
            WHEN (r_score = 4 AND f_score = 4 AND m_score = 4) THEN 'Best Customers'
            WHEN (r_score >= 2 AND f_score = 4 AND m_score >= 1) THEN 'Loyal Customers'
            WHEN (r_score >= 3 AND f_score >= 1 AND m
