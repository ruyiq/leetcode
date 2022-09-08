WITH cte1 AS (
    Select buyer_id 
    FROM Sales 
    JOIN Product p 
        USING(product_id)
    WHERE product_name ="S8" 
) , cte2 AS (
        Select buyer_id 
        FROM Sales 
        JOIN Product p 
            USING(product_id)
        WHERE product_name ="iPhone" 
    )

SELECT DISTINCT buyer_id
FROM Sales s
WHERE buyer_id IN (SELECT buyer_id FROM cte1) AND buyer_id NOT IN (SELECT buyer_id FROM cte2);