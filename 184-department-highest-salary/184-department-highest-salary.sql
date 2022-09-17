with cte as(
    SELECT name, salary, s.departmentId AS departmentId
    FROM (SELECT *, dense_rank() over (PARTITION BY departmentId ORDER BY salary DESC) ranking FROM Employee) s
    WHERE s.ranking=1
)

SELECT DISTINCT d.name AS Department, c.name AS Employee, c.salary AS Salary
FROM cte c
JOIN Department d
    ON d.id=c.departmentId;
