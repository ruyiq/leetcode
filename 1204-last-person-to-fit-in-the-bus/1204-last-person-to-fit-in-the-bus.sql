# Write your MySQL query statement below
WITH CTE AS(
    SELECT *,
        SUM(weight) OVER (ORDER BY turn) as acc_sum
    FROM Queue  
),

CTE2 AS(
    SELECT MAX(turn) AS turn
    FROM CTE 
    WHERE acc_sum<=1000
)

SELECT q.person_name AS person_name 
FROM Queue q, CTE2 c
WHERE q.turn = c.turn
