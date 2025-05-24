# Write your MySQL query statement below

with ranked_employee AS (
    SELECT id, 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) as employee_rank
    FROM Employee
)

SELECT MAX(salary) AS SecondHighestSalary 
FROM ranked_employee 
WHERE employee_rank = 2