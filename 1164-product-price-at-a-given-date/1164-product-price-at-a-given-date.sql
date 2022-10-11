SELECT product_id, new_price AS price
FROM Products
WHERE change_date="2019-08-16"

union 

SELECT product_id, new_price As price
FROM (SELECT *,rank() over(PARTITION BY product_id ORDER BY change_date DESC) rk FROM Products WHERE change_date<"2019-08-16") s
WHERE rk=1 and product_id NOT IN (SELECT product_id FROM Products
WHERE change_date="2019-08-16")

union

SELECT product_id, 10 As price
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM Products WHERE change_date<="2019-08-16" )