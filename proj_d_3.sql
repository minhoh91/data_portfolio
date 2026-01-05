-- For each user, calculate the total number of distinct merchant categories they shop in. 
-- Compare this against the platform-wide average to categorize users by "Engagement Persona."

WITH user_category_count AS(
SELECT
  t.user_id
  , COUNT(DISTINCT m.category) AS unique_category_count
FROM transactions t
JOIN merchants m ON t.merchant_id = m.merchant_id
GROUP BY t.user_id
),

platform_average AS(
SELECT
  AVG(unique_category_count) AS avg_categories
FROM user_category_count
)

SELECT
  u.user_id
  , u.unique_category_count
  , CASE WHEN u.unique_category_count > p.avg_categories THEN 'High'
  WHEN u.unique_category_count = p.avg_categories THEN 'Average'
  ELSE 'Low' END AS engagement_persona
FROM user_category_count u 
CROSS JOIN platform_average p
;
