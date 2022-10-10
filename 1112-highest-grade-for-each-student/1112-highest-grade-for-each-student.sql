SELECT student_id, course_id, grade
FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id) rk FROM Enrollments) s
WHERE rk=1
