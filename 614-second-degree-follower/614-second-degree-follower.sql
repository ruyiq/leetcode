with cte1 as (
    SELECT followee, COUNT(follower) as c
    FROM Follow
    GROUP BY followee
    HAVING COUNT(follower)>=1
), cte2 as (
    SELECT follower
    FROM FOllow
    GROUP BY follower
    HAVING COUNT(follower)>=1
)

SELECT cte2.follower AS follower , cte1.c AS num 
FROM cte1
JOIN cte2
    ON cte1.followee=cte2.follower
ORDER BY cte2.follower
    