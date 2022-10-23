with cte as (
    SELECT a.user_id as u1, b.user_id as u2, COUNT(*) as common_friend 
    FROM Relations a, Relations b
    WHERE a.user_id < b.user_id
        AND a.follower_id = b.follower_id
    GROUP BY a.user_id, b.user_id
)

SELECT u1 AS user1_id, u2 AS user2_id
FROM cte
WHERE common_friend = (SELECT MAX(common_friend) FROM cte);