WITH cte AS (
    SELECT *, dense_rank() over (PARTITION BY departmentId ORDER BY salary DESC) AS rk FROM Employee 
)

SELECT d.name AS Department , c.name AS Employee , c.salary AS Salary 
FROM cte c
JOIN Department d
    ON d.id=c.departmentId AND c.rk<=3;