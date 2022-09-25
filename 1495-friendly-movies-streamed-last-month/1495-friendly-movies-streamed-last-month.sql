SELECT DISTINCT c.title
FROM Content c
JOIN TVProgram t
    USING(content_id)
WHERE Kids_content="Y" 
    AND MONTH(program_date)=6 
    AND YEAR(program_date)=2020 
    AND content_type="Movies";