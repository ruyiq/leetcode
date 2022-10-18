SELECT user_id, MAX(diff) AS biggest_window
FROM (
    SELECT *, 
           DATEDIFF(LEAD(visit_date, 1, '2021-01-01') OVER (PARTITION BY user_id ORDER BY visit_date), visit_date) AS diff
        FROM userVisits
) s

GROUP BY user_id
ORDER BY user_id;