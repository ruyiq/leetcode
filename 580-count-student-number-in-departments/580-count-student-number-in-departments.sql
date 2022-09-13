SELECT dept_name, COUNT(DISTINCT student_id) AS student_number
FROM Department d
LEFT JOIN Student s
    USING(dept_id)
GROUP BY dept_name
ORDER BY student_number DESC, dept_name;