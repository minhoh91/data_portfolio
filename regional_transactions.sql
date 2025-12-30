-- Provide a breakdown of total purchase volume and the number of purchases by sales region, ordered from highest to lowest spend.
SELECT
  sales_region
  , COUNT(transaction_id) as purchase_count
  , SUM(amount) AS total_purchase_amount
FROM users u
JOIN transactions t
  ON u.user_id = t.user_id
WHERE transaction_type = 'purchase'
GROUP BY sales_region
ORDER BY SUM(amount) DESC
;

