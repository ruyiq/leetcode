# Write your MySQL query statement below
WITH a AS (
    SELECT followee AS name, COUNT(DISTINCT follower) AS cnt
    FROM Follow
    GROUP BY followee
    HAVING COUNT(DISTINCT follower)>=1
)

SELECT DISTINCT f.follower,  cnt AS num
FROM Follow f
JOIN a ON f.follower = a.name
ORDER BY f.follower;