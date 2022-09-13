WITH cte AS (
    SELECT managerId, COUNT(managerId) AS count_m
    FROM Employee
    GROUP BY managerId
)

SELECT name
FROM Employee e
JOIN cte c
    ON e.id=c.managerId AND count_m>=5;