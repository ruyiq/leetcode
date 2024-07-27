WITH CTE AS(
    SELECT * FROM
        (SELECT product_id,
           new_price AS price,     
           change_date,
           RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS date_rank 
        FROM Products 
        WHERE change_date <= "2019-08-16") k
    WHERE date_rank=1
)

SELECT DISTINCT p.product_id,
    IF(c.price IS NULL, 10, c.price) AS price
FROM Products p
LEFT JOIN CTE c USING(product_id)
