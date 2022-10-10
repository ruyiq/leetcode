with cte as (
    SELECT DISTINCT user_id, activity_date
    FROM (SELECT *, RANK() OVER(PARTITION BY user_id ORDER BY activity_date) ranking FROM Traffic WHERE activity="login") s
    WHERE ranking=1 
)

SELECT activity_date AS login_date, COUNT(user_id) AS user_count  
FROM cte
WHERE activity_date between date_sub('2019-06-30', interval 90 day) and '2019-06-30'
GROUP BY activity_date;