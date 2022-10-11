WITH cte AS(
    SELECT * 
    FROM (SELECT *, rank() over(PARTITION BY customer_id ORDER BY order_date) rk FROM Delivery) s
    WHERE rk=1)

SELECT ROUND(COUNT(delivery_id)/(SELECT COUNT(delivery_id) FROM cte)*100,2) AS immediate_percentage 
FROM cte
WHERE order_date= customer_pref_delivery_date;