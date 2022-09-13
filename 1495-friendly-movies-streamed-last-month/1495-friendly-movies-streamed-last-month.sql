SELECT DISTINCT c.title 
FROM Content c
JOIN TVProgram t
    USING(content_id)
WHERE c.Kids_content="Y" AND t.program_date like "2020-06%" AND c.content_type  ="Movies";