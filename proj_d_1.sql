-- Identify users who have spent more than $1,000 in the 'Luxury' category while residing in the 'West' or 'North' regions. 
-- The output should list the user_id, merchant_name, and the total amount spent at that specific merchant.

SELECT
  u.user_id
  , merchant_name
  , SUM(amount) AS total_spent
FROM users u
JOIN transactions t ON u.user_id = t.transaction_id
JOIN merchants m ON t.merchant_id = m.merchant_id
WHERE u.sales_region IN ('West', 'North')
AND m.category = 'Luxury'
GROUP BY u.user_id, merchant_name
HAVING SUM(amount) > 1000;

