SELECT p.product_name,
    p.product_id,
    s.order_id,
    s.order_date
FROM (SELECT*, 
      RANK() OVER(PARTITION BY product_id ORDER BY order_date DESC) rk
      FROM Orders
) s
JOIN Products p
    USING(product_id)
WHERE s.rk=1
ORDER BY p.product_name, p.product_id, s.order_id 