with bins as (
select '[0-5>' as bin
union all
select '[5-10>' as bin
union all
select '[10-15>' as bin
union all
select '15 or more' as bin
), cte as(
    SELECT CASE WHEN duration>=0 AND duration<5*60 THEN "[0-5>"
                WHEN duration>=5*60 AND duration<10*60 THEN "[5-10>"
                WHEN duration>=600 AND duration<15*60 THEN "[10-15>"
                ELSE "15 or more" END AS bin, IFNULL(COUNT(duration),0) AS total
    FROM Sessions
    GROUP BY bin
)
SELECT bin, IFNULL(total,0) AS total        
FROM cte
RIGHT JOIN bins
    USING(bin)