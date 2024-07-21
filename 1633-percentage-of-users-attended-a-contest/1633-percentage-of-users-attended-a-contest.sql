# Write your MySQL query statement below
SELECT r.contest_id , ROUND(COUNT(r.user_id)/(SELECT COUNT(DISTINCT user_id) FROM Users)*100,2) percentage 
FROM Register r
LEFT JOIN Users u USING(user_id)
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id