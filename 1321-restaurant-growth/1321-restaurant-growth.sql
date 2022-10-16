with cte as (
    SELECT visited_on, SUM(amount) AS day_sum 
    FROM Customer 
    GROUP BY visited_on 
)

SELECT c2.visited_on, 
    SUM(c1.day_sum) as amount, 
    ROUND(SUM(c1.day_sum)/7,2) AS average_amount
FROM cte c1, cte c2
WHERE DATEDIFF(c2.visited_on, c1.visited_on) BETWEEN 0 AND 6
GROUP BY c2.visited_on
HAVING COUNT(c1.visited_on) = 7;