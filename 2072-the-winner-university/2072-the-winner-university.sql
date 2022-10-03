with cte1 as (
    SELECT COUNT(score) as c
    FROM NewYork
    WHERE score>=90
), cte2 as (
    SELECT COUNT(score) as c
    FROM California 
    WHERE score>=90
)

SELECT CASE WHEN cte1.c>cte2.c THEN "New York University"
            WHEN cte1.c<cte2.c THEN "California University"
            ELSE "No Winner" END AS winner
FROM cte1, cte2;              