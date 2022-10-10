SELECT product_id, year AS first_year, quantity, price 
FROM (SELECT *, RANK() OVER (PARTITION BY product_id ORDER BY year) ranking FROM Sales) s
WHERE ranking=1;