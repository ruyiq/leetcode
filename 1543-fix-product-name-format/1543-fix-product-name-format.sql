SELECT
    trim(lower(product_name)) AS product_name,
    date_format(sale_date, '%Y-%m') AS sale_date,
    count(*) AS total
FROM Sales
GROUP BY 1, 2
ORDER BY 1, 2