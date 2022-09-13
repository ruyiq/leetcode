SELECT seller_name
FROM Seller s
LEFT JOIN Orders o
    ON o.seller_id=s.seller_id 
LEFT JOIN Customer c
    ON o.customer_id=c.customer_id
WHERE s.seller_id NOT IN (SELECT seller_id FROM Orders WHERE YEAR(sale_date)=2020)
ORDER BY seller_name;