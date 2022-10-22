with cte as (
    SELECT account_id, 
        MONTH(day) as months, 
        SUM(amount) as total_income,
        transaction_id 
    FROM Transactions 
    WHERE type="Creditor" 
    GROUP BY account_id, MONTH(day)
),

cte2 as (
    SELECT *
    FROM cte
    JOIN Accounts a
        USING(account_id)
    WHERE a.max_income < total_income
)

SELECT DISTINCT a.account_id
FROM cte2 a, cte2 b
WHERE a.months = b.months-1
    AND a.account_id = b.account_id
ORDER BY a.transaction_id 