-- Identify users who were active in the past but have had zero transactions in the last 30 days. 
-- Business Logic: We want to target these people with a "We miss you" email. Join the users table to the transactions table to find people with no recent activity.

WITH recent_users AS (
    SELECT DISTINCT user_id
    FROM transactions
    WHERE transaction_date >= CURDATE() - INTERVAL 30 DAY
)
SELECT u.user_id
FROM users u
LEFT JOIN recent_users r
  ON u.user_id = r.user_id
WHERE u.status = 'active'
  AND r.user_id IS NULL;
