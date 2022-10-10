with avg_activity as (
    SELECT event_type, AVG(occurences) as o
    FROM Events
    GROUP BY event_type
)

SELECT e.business_id
FROM Events e
JOIN avg_activity a
    ON e.event_type = a.event_type 
WHERE e.occurences > a.o
GROUP BY e.business_id
HAVING COUNT(e.event_type)>1;