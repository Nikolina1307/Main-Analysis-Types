WITH unique_events AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY COUNT(event_name) DESC) AS row_num,
        event_name,
        COUNT(event_name) events,
        SUM(CASE WHEN country='United States' THEN 1 ELSE 0 END) AS US_events,
        SUM(CASE WHEN country='India' THEN 1 ELSE 0 END) AS India_events,
        SUM(CASE WHEN country='Canada' THEN 1 ELSE 0 END) AS Canada_events
    FROM (
        SELECT
            *,
            ROW_NUMBER() OVER (PARTITION BY user_pseudo_id, event_name ORDER BY user_first_touch_timestamp) AS no_event
        FROM
            tc-da-1.turing_data_analytics.raw_events
        ORDER BY
            user_pseudo_id
        )
    WHERE
        no_event = 1
        AND event_name IN ('page_view', 'view_item', 'add_to_cart', 'begin_checkout', 'purchase')
    GROUP BY
        2,
        event_name
    ORDER BY
        events DESC
    )
SELECT
    row_num,
    event_name,
    US_events,
    India_events,
    Canada_events,
    ROUND(100*events/(FIRST_VALUE(events) OVER(ORDER BY row_num)),2) AS Full_perc,
    ROUND(100*US_events/(FIRST_VALUE(US_events)OVER(ORDER BY row_num)),2) AS US_perc_drop,
    ROUND(100*India_events/(FIRST_VALUE(India_events)OVER(ORDER BY row_num)),2) AS India_perc_drop,
    ROUND(100*Canada_events/(FIRST_VALUE(Canada_events)OVER(ORDER BY row_num)),2) AS Canada_perc_drop
FROM
    unique_events
