SELECT contest_id, ROUND(COUNT(r.user_id)/(SELECT COUNT(user_id) FROM Users) * 100,2) AS percentage 
FROM Register r
LEFT JOIN Users u
    USING(user_id)
    GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;
