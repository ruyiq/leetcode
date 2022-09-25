SELECT p.product_name, SUM(o.unit) AS unit
FROM Products p
JOIN Orders o
    USING(product_id)
WHERE MONTH(o.order_date)=2
GROUP BY product_id
HAVING unit>=100