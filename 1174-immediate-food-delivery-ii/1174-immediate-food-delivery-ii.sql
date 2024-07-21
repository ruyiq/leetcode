# Write your MySQL query statement below
WITH labeled_orders AS (
    SELECT *, 
    RANK() OVER (PARTITION BY customer_id ORDER BY order_date) as orders_rank
    FROM Delivery
)

SELECT  ROUND(SUM(IF(order_date=customer_pref_delivery_date,1,0))*100/COUNT(delivery_id),2) immediate_percentage 
FROM labeled_orders 
WHERE orders_rank=1