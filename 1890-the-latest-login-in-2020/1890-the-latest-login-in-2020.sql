# Write your MySQL query statement below
SELECT user_id, MAX(time_stamp) AS last_stamp          
FROM Logins
WHERE user_id IN (SELECT user_id FROM Logins WHERE YEAR(time_stamp          ) = 2020)
    AND YEAR(time_stamp)=2020
GROUP BY user_id;