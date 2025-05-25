# Write your MySQL query statement below
WITH manager AS (
    SELECT DISTINCT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(DISTINCT id)>=5
)

SELECT e.name AS name
FROM manager m
JOIN Employee e ON m.managerId = e.id