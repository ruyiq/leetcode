# Write your MySQL query statement below
SELECT customer_id
FROM Customer c
JOIN Product p USING(product_key)
GROUP BY customer_id
HAVING COUNT(DISTINCT c.product_key)= (SELECT COUNT(DISTINCT product_key) FROM Product)



