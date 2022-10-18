SELECT transaction_id 
FROM (  SELECT *, dense_rank() over(PARTITION BY DATE(day) ORDER BY amount DESC) rk
        FROM Transactions 
) s
WHERE rk=1
ORDER BY transaction_id ASC
