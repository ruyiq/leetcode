

SELECT IFNULL(ROUND(COUNT(distinct session_id)/COUNT(distinct user_id),2),0) AS average_sessions_per_user 
FROM Activity
where activity_date >="2019-06-28" and activity_date <= "2019-07-27"
