WITH count_scheduled AS (
    SELECT COUNT(delivery_id) as c
    FROM Delivery
    WHERE order_date=customer_pref_delivery_date)

SELECT ROUND(count_scheduled.c/COUNT(d.delivery_id)*100,2) AS immediate_percentage
FROM Delivery d, count_scheduled;

