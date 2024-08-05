# Write your MySQL query statement below
WITH less_than_3000 AS (
    SELECT employee_id, manager_id
    FROM Employees
    GROUP BY employee_id
    HAVING SUM(salary)< 30000
)

SELECT employee_id
FROM less_than_3000 
WHERE manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id
