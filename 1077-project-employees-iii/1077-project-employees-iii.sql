WITH cte AS (
    SELECT p.project_id AS project_id, p.employee_id AS employee_id, e.experience_years AS experience_years 
    FROM Project p
    JOIN Employee e
        ON p.employee_id =e.employee_id 
)


SELECT project_id, employee_id
FROM (SELECT *,rank() over (PARTITION BY project_id ORDER BY experience_years DESC )as ranking FROM cte )s
WHERE s.ranking=1

