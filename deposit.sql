-- Measure the health of the signup funnel.
-- Business Logic: Of all users who signed up in the last 90 days, what percentage have made at least one deposit?

WITH recent_users AS(
SELECT
  user_id
FROM users 
WHERE signup_date >= CURDATE() - INTERVAL 90 DAY
),

deposit_users AS(
SELECT
  distinct user_id
FROM transactions
WHERE transaction_type = 'direct deposit'
)
  
SELECT
  COUNT(r.user_id) total_users
  , COUNT(d.user_id) total_depositors
  , COUNT(d.user_id) / COUNT(r.user_id) * 100 AS pct
FROM recent_users r 
LEFT JOIN deposit_users d
  ON r.user_id = d.user_id
;

