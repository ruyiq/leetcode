# Write your MySQL query statement below

WITH cte AS (
    SELECT project_id, COUNT(DISTINCT employee_id) AS total
    FROM Project
    GROUP BY project_id
)

SELECT DISTINCT project_id  
FROM cte
WHERE total = (SELECT MAX(total) FROM cte)