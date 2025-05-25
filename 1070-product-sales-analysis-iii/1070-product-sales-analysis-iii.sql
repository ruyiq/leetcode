# Write your MySQL query statement below
WITH product_introduction_year AS (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
)

SELECT s.product_id, s.year AS first_year, quantity, s.price
FROM Sales s
JOIN product_introduction_year p ON s.year = p.first_year
    AND s.product_id = p.product_id
