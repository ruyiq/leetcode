with cust as(
    SELECT *
    FROM Orders o
    WHERE customer_id NOT IN (SELECT customer_id FROM Orders WHERE product_name="C")
), cte2 as (
    SELECT c1.customer_id  
    FROM cust c1, cust c2
    WHERE c1.customer_id = c2.customer_id
        AND c1.product_name="A"
        AND c2.product_name="B"
    GROUP BY customer_id
)

SELECT cte2.customer_id, c.customer_name
FROM cte2
JOIN Customers c
    USING(customer_id);