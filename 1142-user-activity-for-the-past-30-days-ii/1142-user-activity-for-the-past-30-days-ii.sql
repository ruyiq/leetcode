with cte as (
    SELECT user_id, COUNT(DISTINCT session_id) as s
    FROM Activity 
    WHERE activity_date<="2019-07-27" AND activity_date>="2019-06-28"
    GROUP BY user_id
)

SELECT IFNULL(ROUND(SUM(s)/COUNT(*),2),0) AS average_sessions_per_user 
FROM cte