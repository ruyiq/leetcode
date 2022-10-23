with all_friends as(
    select user1_id as user,user2_id as friend from friendship
    UNION
    select user2_id as user,user1_id as friend from friendship)

SELECT a.user as user1_id, b.user as user2_id, count(*) as common_friend
FROM all_friends a
JOIN all_friends b
    ON a.user < b.user 
    AND a.friend = b.friend
    AND (a.user, b.user) in (select user, friend from all_friends)
GROUP BY a.user, b.user
HAVING COUNT(*)>=3