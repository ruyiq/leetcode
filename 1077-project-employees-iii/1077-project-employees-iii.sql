# Write your MySQL query statement below
WITH employee_experience AS (
    SELECT p.project_id, e.employee_id, e.name, experience_years 
    FROM Project p
    LEFT JOIN Employee e ON p.employee_id = e.employee_id
)

SELECT project_id, employee_id
FROM (
    SELECT 
    project_id,
    employee_id, 
    RANK() OVER (PARTITION BY project_id ORDER BY experience_years DESC) AS rk
    FROM employee_experience
) temp
WHERE rk = 1
