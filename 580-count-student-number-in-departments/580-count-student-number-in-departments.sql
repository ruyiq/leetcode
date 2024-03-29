SELECT d.dept_name,
    IFNULL(COUNT(student_id),0) AS student_number
FROM Department d
LEFT JOIN Student s
    USING(dept_id)
GROUP BY d.dept_name   
ORDER BY student_number DESC, dept_name