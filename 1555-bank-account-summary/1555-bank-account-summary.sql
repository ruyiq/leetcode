with cte as (
    SELECT trans_id, paid_to, amount   
    FROM Transactions
    
    UNION ALL
    
    SELECT trans_id, paid_by, -amount   
    FROM Transactions 
)

SELECT u.user_id,
    u.user_name,  
    u.credit+IFNULL(SUM(c.amount),0) AS credit,     
    IF(u.credit+IFNULL(SUM(c.amount),0)<0,'Yes','No') AS credit_limit_breached 
FROM cte c
RIGHT JOIN Users u
    ON c.paid_to=u.user_id
GROUP BY u.user_id