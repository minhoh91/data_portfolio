-- Identify merchants with a risk_level of 4 or 5 that have processed more than 50 transactions in the last 60 days. 
-- Calculate the average transaction amount and flag any merchant where the average exceeds $500.

SELECT
  m.merchant_id
  , m.merchant_name
  , m.risk_level
  , COUNT(transaction_id) AS transaction_count
  , AVG(t.amount) AS transaction_average
  , CASE WHEN AVG(transaction_amount) > 500 THEN 'HIGH RISK' ELSE 'MONITOR' END AS audit
FROM transactions t
JOIN merchants m ON t.merchant_id = m.merchant_id
WHERE risk_level >= 4
  AND transaction_type = 'Purchase'
  AND tranction_date >= CURDATE() - INTERVAL 60 DAY
GROUP BY merchant_id, merchant_name, risk_level
HAVING COUNT(transction_id) > 50
;
