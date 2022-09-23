SELECT s.name 
FROM SalesPerson s
WHERE s.name NOT IN 
        (SELECT s.name 
    FROM SalesPerson s
    JOIN Orders o
        USING(sales_id)
    JOIN Company c
        USING(com_id)
    WHERE c.name="RED")