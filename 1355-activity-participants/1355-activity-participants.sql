with min_max as (
    SELECT activity,
        COUNT(*) as cnt,
        RANK() OVER (ORDER BY COUNT(*) ASC) AS rnk_asc,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk_desc
    FROM Friends
    GROUP BY activity
)

SELECT activity
FROM min_max
WHERE rnk_asc != 1 AND rnk_desc != 1