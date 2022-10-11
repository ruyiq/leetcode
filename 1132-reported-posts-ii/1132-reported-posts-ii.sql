WITH cte AS (
    SELECT COUNT(distinct r.post_id)/COUNT(distinct a.post_id) as c
    FROM Actions a
    LEFT JOIN Removals r
        USING(post_id)
    WHERE action="report" AND extra="spam"
    GROUP BY action_date
)

SELECT ROUND(avg(c)*100,2) AS average_daily_percent 
FROM cte;