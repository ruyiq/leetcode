# Write your MySQL query statement below
WITH first_years AS(
    SELECT product_id, 
            MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
)

SELECT fy.product_id, fy.first_year, s.quantity, s.price
FROM Sales s
RIGHT JOIN first_years fy ON s.product_id = fy.product_id 
    AND fy.first_year = s.year
