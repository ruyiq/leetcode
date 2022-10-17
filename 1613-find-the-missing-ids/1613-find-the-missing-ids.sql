WITH RECURSIVE cte AS (
    SELECT 1 as continued_id
    UNION 
    SELECT continued_id + 1
    FROM cte
    WHERE continued_id < (SELECT MAX(customer_id) FROM Customers) 
)

SELECT cte.continued_id AS ids
FROM cte
WHERE cte.continued_id NOT IN (SELECT customer_id FROM Customers);