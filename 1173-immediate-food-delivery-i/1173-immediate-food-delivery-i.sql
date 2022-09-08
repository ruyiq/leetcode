
WITH cte AS (
    SELECT COUNT(DISTINCT delivery_id) AS t FROM Delivery WHERE order_date=customer_pref_delivery_date)
    
SELECT ROUND(cte.t/COUNT(d.delivery_id)*100,2) AS immediate_percentage 
FROM Delivery d, cte;