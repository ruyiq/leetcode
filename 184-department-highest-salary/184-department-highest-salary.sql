with cte as (
    SELECT departmentId, name, salary
    FROM (SELECT *, rank() over(PARTITION BY departmentId ORDER BY salary DESC) ranking FROM Employee)s
    WHERE ranking=1
)

SELECT d.name AS Department , c.name AS Employee , c.salary
FROM cte c
JOIN Department d
    ON c.departmentId=d.id;