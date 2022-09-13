SELECT s.product_id,
    year AS first_year,
    s.quantity,
    s.price
FROM (SELECT *, rank() over (PARTITION BY product_id ORDER BY year) as ranking FROM Sales) s
WHERE s.ranking=1;