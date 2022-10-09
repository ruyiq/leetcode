-- create select statement:
SELECT
    -- check if number is last number:
    IF(id < (SELECT MAX(id) FROM Seat),
      -- if not last number, then check logical condition:
      IF(MOD(id,2) = 0, id-1,id+1),
       -- if is last number, check if odd or even, otherwise return id:
        IF(MOD(id,2) = 0, id-1,id)
       ) AS id,
    student
-- from clause:
FROM Seat
-- order by id ASC:
ORDER BY id ASC