SELECT u.name, SUM(t.amount) AS balance
FROM Users u
JOIN Transactions t
    USING(account)
GROUP BY account
HAVING balance>10000
