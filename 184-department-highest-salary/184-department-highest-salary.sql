WITH id_and_highest_salary AS (
    SELECT rank() over (PARTITION BY departmentId ORDER BY salary DESC) AS rk, id , name, salary, departmentId FROM Employee
)

SELECT d.name AS Department, i.name AS Employee, i.salary AS Salary
FROM id_and_highest_salary i
JOIN Department d
    ON d.id=i.departmentId 
WHERE i.rk=1;