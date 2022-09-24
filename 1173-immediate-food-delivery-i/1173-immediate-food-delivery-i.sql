with cte as (
   SELECT delivery_id, customer_id 
    FROM Delivery
    WHERE order_date=customer_pref_delivery_date    
)

SELECT IFNULL(ROUND(COUNT(DISTINCT cte.delivery_id)/COUNT(DISTINCT d.delivery_id )*100,2),0) AS immediate_percentage  
FROM Delivery d, cte