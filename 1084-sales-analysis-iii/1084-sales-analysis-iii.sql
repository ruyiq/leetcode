SELECT DISTINCT product_id, product_name
FROM Product p
JOIN Sales s
    USING(product_id)
WHERE product_id NOT IN (SELECT product_id FROM Sales WHERE QUARTER(sale_date) IN (2,3,4))
    AND YEAR(s.sale_date)=2019;