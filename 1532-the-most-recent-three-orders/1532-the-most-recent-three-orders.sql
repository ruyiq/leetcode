SELECT c.name AS customer_name,
    c.customer_id,
    s.order_id,
    s.order_date
FROM (SELECT *, rank() over (PARTITION BY customer_id ORDER BY order_date DESC) rk FROM Orders )s
JOIN Customers c
    USING(customer_id)
WHERE s.rk IN (1,2,3)
ORDER BY c.name, c.customer_id, s.order_date DESC;