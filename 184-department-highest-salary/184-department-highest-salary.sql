# Write your MySQL query statement below
with cte as (
    SELECT RANK() over (PARTITION BY departmentId ORDER BY salary DESC) rk, departmentId, name, salary FROM Employee)

SELECT d.name AS 'Department', 
    cte.name AS 'Employee', 
    cte.salary AS 'Salary'
FROM cte
    JOIN department d
    ON d.id=cte.departmentId AND rk=1;
