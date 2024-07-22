SELECT 
    MAX(num) AS num 
FROM (
    SELECT num, COUNT(num) AS cnt 
    FROM MyNumbers 
    GROUP BY num 
    ORDER BY cnt 
) AS subquery
WHERE cnt = 1
