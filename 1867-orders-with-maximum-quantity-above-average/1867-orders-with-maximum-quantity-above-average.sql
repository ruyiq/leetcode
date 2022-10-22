with cte as (
    SELECT order_id, 
        SUM(quantity)/COUNT(*) AS a,
        MAX(quantity) as max
    FROM OrdersDetails
    GROUP BY order_id
)

SELECT order_id 
FROM cte
WHERE max > (SELECT MAX(a) FROM cte);