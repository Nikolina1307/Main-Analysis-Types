WITH t1 AS (
    SELECT
        month,
        Campaign,
        impressions AS total_impressions
    FROM
        `tc-da-1.turing_data_analytics.adsense_monthly`
    WHERE
        campaign IN ('NewYear_V1', 'NewYear_V2', 'BlackFriday_V1', 'BlackFriday_V2')
        AND month BETWEEN 202011 AND 202101
),
t2 AS (
    SELECT DISTINCT
        user_pseudo_id,
        campaign
    FROM
        `tc-da-1.turing_data_analytics.raw_events`
    WHERE
        event_name = 'page_view'
        AND campaign IN ('NewYear_V1', 'NewYear_V2', 'BlackFriday_V1', 'BlackFriday_V2')
)
SELECT
    t1.month,
    t1.campaign,
    total_impressions,
    COUNT(t2.campaign) AS unique_clicks
FROM
    t1
JOIN
    t2 ON t1.campaign = t2.campaign
GROUP BY
    t1.month, t1.campaign, total_impressions;
