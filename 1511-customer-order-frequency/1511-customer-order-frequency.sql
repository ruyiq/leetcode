SELECT c.customer_id, c.name
FROM Customers c
JOIN Orders o
    ON o.customer_id=c.customer_id
JOIN Product p
    USING(product_id)
GROUP BY c.customer_id  
HAVING
    SUM(IF(MONTH(order_date) = '06',price,0)*quantity) >= 100
    AND
    SUM(IF(MONTH(order_date) = '07',price,0)*quantity) >= 100