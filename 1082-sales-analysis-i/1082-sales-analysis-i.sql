with cte as (
    SELECT *, SUM(p.unit_price*s.quantity) AS p
    FROM Product p
    JOIN Sales s
        USING(product_id)
    GROUP BY seller_id
)

SELECT seller_id   
FROM cte
WHERE p=(SELECT MAX(p) FROM cte);