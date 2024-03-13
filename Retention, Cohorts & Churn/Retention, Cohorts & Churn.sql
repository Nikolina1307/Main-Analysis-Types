WITH weekly_subscriptions AS (
  SELECT DISTINCT
    user_pseudo_id,
    s.subscription_start AS start_date,
    s.subscription_end AS end_date,
    DATE_TRUNC(s.subscription_start, WEEK) AS cohort
  FROM turing_data_analytics.subscriptions s
)
 
SELECT
  cohort,
  COUNT(*) as cohort_size,
-- Retention counts
  SUM(CASE WHEN end_date = start_date OR end_date IS NULL THEN 1 ELSE 0 END) AS week_0,
  SUM(CASE WHEN end_date > DATE_ADD(start_date,INTERVAL 1 week) OR end_date IS NULL THEN 1 ELSE 0 END) AS week_1,
  SUM(CASE WHEN end_date > DATE_ADD(start_date,INTERVAL 2 week) OR end_date IS NULL THEN 1 ELSE 0 END) AS week_2,
  SUM(CASE WHEN end_date > DATE_ADD(start_date,INTERVAL 3 week) OR end_date IS NULL THEN 1 ELSE 0 END) AS week_3,
  SUM(CASE WHEN end_date > DATE_ADD(start_date,INTERVAL 4 week) OR end_date IS NULL THEN 1 ELSE 0 END) AS week_4,
  SUM(CASE WHEN end_date > DATE_ADD(start_date,INTERVAL 5 week) OR end_date IS NULL THEN 1 ELSE 0 END) AS week_5,
  SUM(CASE WHEN end_date > DATE_ADD(start_date,INTERVAL 6 week) OR end_date IS NULL THEN 1 ELSE 0 END) AS week_6,
-- Retention rates in % with a % symbol
  ROUND(SUM(CASE WHEN end_date = start_date OR end_date IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) || '%' AS week_0_rate,
  ROUND(SUM(CASE WHEN end_date > DATE_ADD(start_date,INTERVAL 1 week) OR end_date IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) || '%' AS week_1_rate,
  ROUND(SUM(CASE WHEN end_date > DATE_ADD(start_date,INTERVAL 2 week) OR end_date IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) || '%' AS week_2_rate,
  ROUND(SUM(CASE WHEN end_date > DATE_ADD(start_date,INTERVAL 3 week) OR end_date IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) || '%' AS week_3_rate,
  ROUND(SUM(CASE WHEN end_date > DATE_ADD(start_date,INTERVAL 4 week) OR end_date IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) || '%' AS week_4_rate,
  ROUND(SUM(CASE WHEN end_date > DATE_ADD(start_date,INTERVAL 5 week) OR end_date IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) || '%' AS week_5_rate,
  ROUND(SUM(CASE WHEN end_date > DATE_ADD(start_date,INTERVAL 6 week) OR end_date IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) || '%' AS week_6_rate
  FROM weekly_subscriptions
  GROUP BY cohort;
