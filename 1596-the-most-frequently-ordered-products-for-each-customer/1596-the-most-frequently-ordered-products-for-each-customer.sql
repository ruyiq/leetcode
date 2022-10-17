SELECT customer_id, product_id, product_name 
FROM (SELECT *, 
      RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(product_id) DESC) rk 
      FROM Orders o
      JOIN Products p
            USING(product_id)
      GROUP BY customer_id, product_id
     ) s
WHERE s.rk=1;