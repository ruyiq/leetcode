with cte as (
    SELECT project_id, COUNT(employee_id) as c
    FROM Project
    GROUP BY project_id
)

SELECT project_id
FROM cte
WHERE c=(SELECT MAX(c) FROM cte)