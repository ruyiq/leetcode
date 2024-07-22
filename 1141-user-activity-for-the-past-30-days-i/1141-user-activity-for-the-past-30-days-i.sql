# Write your MySQL query statement below
WITH CTE AS(
    SELECT 
    *,
    COUNT(activity_type) AS activities
    FROM Activity
    WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
    GROUP BY activity_date, user_id
)

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users 
FROM CTE
WHERE activities >= 1
GROUP BY activity_date
ORDER BY activity_date

