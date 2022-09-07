# Write your MySQL query statement below
SELECT s.name
FROM salesperson s
WHERE sales_id NOT IN (
    SELECT sales_id
    FROM orders
    LEFT JOIN company c
        USING(com_id)
    WHERE c.name = "RED"
);
