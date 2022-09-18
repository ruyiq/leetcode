with by_event as (
    SELECT event_type, sum(occurences)/count(occurences) as avg
    FROM Events
    GROUP BY event_type
)

SELECT business_id
FROM Events
JOIN by_event b
    USING(event_type)
WHERE occurences>b.avg
GROUP BY business_id
HAVING COUNT(*) > 1