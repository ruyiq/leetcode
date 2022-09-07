# Write your MySQL query statement below
SELECT customer_id, 
    COUNT(visit_id) AS count_no_trans
From visits v
LEFT JOIN transactions t
    USING(visit_id)
WHERE amount=0 OR amount IS NULL
GROUP BY customer_id;