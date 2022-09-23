WITH cte AS(
    SELECT num, COUNT(num) as counts
    FROM MyNumbers
    GROUP BY num)
    
SELECT(
    SELECT num
    FROM cte
    WHERE counts=1 
    ORDER BY num DESC
    LIMIT 1
) as num;