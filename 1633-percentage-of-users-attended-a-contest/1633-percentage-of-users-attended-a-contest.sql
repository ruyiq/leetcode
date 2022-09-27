SELECT contest_id, ROUND(COUNT(DISTINCT r.user_id)/(SELECT COUNT(DISTINCT user_id) FROM Users)*100,2) AS percentage 
FROM Users u
JOIN Register r
    USING(user_id)
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;