# Write your MySQL query statement below
WITH CTE AS(
SELECT id-1 AS id, student
FROM Seat 
WHERE id%2 = 0

UNION 

SELECT 
    (CASE WHEN id+1 IN (SELECT id FROM Seat) THEN id+1 ELSE id END) AS id
    , student
FROM Seat 
WHERE id%2 = 1
)

SELECT *
FROM CTE
ORDER BY id