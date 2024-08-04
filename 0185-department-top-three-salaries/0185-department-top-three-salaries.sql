# Write your MySQL query statement below
WITH employee_salary_rank AS (
    SELECT departmentId, 
        id,
        name,
        salary,
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS ds_rank
    FROM Employee
),

top_3 AS (
    SELECT *
    FROM employee_salary_rank
    WHERE ds_rank <=3 
)

SELECT DISTINCT d.name AS Department , t.name AS Employee , t.salary AS Salary 
FROM top_3 t
LEFT JOIN Department d ON t.departmentId = d.id