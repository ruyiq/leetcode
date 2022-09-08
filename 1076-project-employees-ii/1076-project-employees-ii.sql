# Write your MySQL query statement below

with cte as (
    SELECT project_id,COUNT(employee_id) as total FROM Project GROUP BY project_id
)
SELECT project_id
FROM cte
WHERE total = (SELECT MAX(total) FROM cte) ;