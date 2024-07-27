# Write your MySQL query statement below
WITH CTE AS(
        SELECT category, COUNT(account_id) AS accounts_count 
    FROM (
        SELECT 
            *,
            (CASE WHEN SUM(income) < 20000 THEN "Low Salary"
            WHEN SUM(income) BETWEEN 20000 AND 50000 THEN "Average Salary"
            ELSE "High Salary" END) AS category
        FROM Accounts
        GROUP BY account_id  
    ) c
    GROUP BY category

    UNION 

    SELECT 'Low Salary' AS category, 0 AS accounts_count

    UNION

    SELECT 'Average Salary' AS category, 0 AS accounts_count

    UNION 

    SELECT 'High Salary' AS category, 0 AS accounts_count
)

SELECT category, SUM(accounts_count) AS accounts_count
FROM CTE
GROUP BY category
