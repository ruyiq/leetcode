WITH cte1 AS (
    SELECT SUM(IF(score>=90,1,0)) as total
    FROM NewYork 
),
    cte2 AS (
    SELECT SUM(IF(score>=90,1,0)) as total
    FROM California 
    )

SELECT CASE WHEN cte1.total>cte2.total THEN "New York University"
            WHEN cte1.total<cte2.total THEN "California University"
            ELSE "No Winner" END AS winner    
FROM cte1, cte2;