
    SELECT DISTINCT product_id, p.product_name
    FROM Sales
    JOIN Product p
        USING(product_id)
    WHERE QUARTER(sale_date)=1 AND product_id NOT IN (SELECT product_id FROM Sales WHERE QUARTER(sale_date) IN (2,3,4));