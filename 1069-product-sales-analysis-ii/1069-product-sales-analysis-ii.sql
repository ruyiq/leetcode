SELECT s.product_id, SUM(s.quantity) AS total_quantity 
FROM Sales s
JOIN Product p
    USING(product_id)
GROUP BY product_id;