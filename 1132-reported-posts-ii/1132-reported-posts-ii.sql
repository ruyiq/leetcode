-- for each date, which posts are spam
-- for much of these posts where later removed

WITH all_spam AS (
    SELECT DISTINCT action_date, post_id
    FROM Actions
    WHERE extra = "spam"    
),

removed AS (
    SELECT action_date, 
        SUM(CASE
            WHEN post_id IN (SELECT post_id FROM Removals) THEN 1
            ELSE 0 END) AS removed_cnt
    FROM all_spam
    GROUP BY action_date
)

SELECT ROUND(AVG(percentage)*100,2) AS average_daily_percent 
FROM (
    SELECT a.action_date, removed_cnt/ COUNT(post_id) AS percentage
    FROM all_spam a
    LEFT JOIN removed r USING(action_date)
    GROUP BY a.action_date
) temp
