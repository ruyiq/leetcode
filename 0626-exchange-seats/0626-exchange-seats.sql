WITH new AS(
    SELECT *,
        (CASE
            WHEN (SELECT COUNT(*) FROM Seat)%2=1 AND id=(SELECT COUNT(*) FROM Seat) THEN id
            WHEN id%2=1 THEN (id+1) 
            WHEN id%2=0 THEN id-1 END) AS new_id
    FROM Seat o
)

SELECT old.id AS id, new.student  AS student
FROM new 
JOIN Seat old ON old.id = new.new_id
ORDER BY old.id