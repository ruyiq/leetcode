(SELECT u.name as results      
FROM Users u
JOIN MovieRating m
    USING(user_id)
GROUP BY user_id
ORDER BY COUNT(movie_id) DESC, u.name
LIMIT 1)

UNION ALL

(SELECT mov.title as results
FROM Movies mov
JOIN MovieRating m   
    USING(movie_id)
WHERE LEFT(created_at,7)='2020-02'
GROUP BY movie_id
ORDER BY AVG(m.rating) DESC, mov.title
LIMIT 1)
