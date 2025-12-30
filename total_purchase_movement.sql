-- Generate a report showing the total purchase volume aggregated by month, ordered chronologically, to help us identify seasonal spending trends.

SELECT
  YEAR(transaction_date) AS yr
  , MONTH(transaction_date) AS mth
  , SUM(amount)
FROM transactions
WHERE transaction_type = 'purchase'
GROUP BY 
