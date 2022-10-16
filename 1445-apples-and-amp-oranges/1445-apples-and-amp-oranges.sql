with cte as (
    SELECT sale_date,
        SUM(IF(fruit="apples", sold_num, 0)) AS apples,
        SUM(IF(fruit="oranges", sold_num, 0)) AS oranges    
    FROM Sales
    GROUP BY sale_date
)

SELECT sale_date, apples-oranges as diff         
FROM cte
ORDER BY sale_date;