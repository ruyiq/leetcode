SELECT f1.user_id, COUNT(DISTINCT follower_id ) AS followers_count
FROM Followers f1
GROUP BY f1.user_id