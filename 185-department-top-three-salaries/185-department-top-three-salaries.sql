# Write your MySQL query statement below
WITH cte AS (
    select DepartmentId, Name, Salary, dense_rank() over (PARTITION BY departmentId ORDER BY Salary DESC) rk FROM employee ) 

SELECT d.name AS 'Department',
    cte.name AS 'Employee',
    cte.salary AS 'Salary'
FROM cte 
    JOIN department d
    ON d.id=cte.DepartmentId 
WHERE cte.rk<4;
    