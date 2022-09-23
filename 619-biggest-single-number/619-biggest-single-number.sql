with cte as (
    SELECT num, COUNT(num) as c
    FROM MyNumbers 
    GROUP BY num
    HAVING c=1
)

SELECT(SELECT num
FROM cte
ORDER BY num DESC
LIMIT 1) as num