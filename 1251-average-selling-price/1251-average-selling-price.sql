SELECT p.product_id,
    ROUND(SUM(u.units * p.price)/ SUM(u.units),2) AS average_price 
FROM Prices p
JOIN UnitsSold u
    ON p.product_id=u.product_id 
    AND start_date <= purchase_date
    AND purchase_date <= end_date
GROUP BY p.product_id;
