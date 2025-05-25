# Write your MySQL query statement below

with a as (
    SELECT requester_id AS id, COALESCE(COUNT(DISTINCT accepter_id),0) AS friends
    FROM RequestAccepted p
    GROUP BY requester_id

    UNION ALL 

    SELECT accepter_id AS id, COALESCE(COUNT(DISTINCT requester_id),0) AS friends
    FROM RequestAccepted p
    GROUP BY accepter_id
)

SELECT id, num
FROM (
    SELECT id, SUM(friends) AS num
    FROM a
    GROUP BY id
) temp
ORDER BY num DESC
LIMIT 1