with friends as (
    SELECT DISTINCT user2_id as fid
    FROM Friendship
    WHERE user1_id=1
    
    UNION 
    
    SELECT DISTINCT user1_id as fid
    FROM Friendship
    WHERE user2_id=1
), liked as (
    SELECT page_id
    FROM Likes
    WHERE user_id=1
)

SELECT DISTINCT page_id AS recommended_page 
FROM Likes l
WHERE l.user_id IN (SELECT fid FROM friends)
AND page_id NOT IN (SELECT page_id FROM liked);