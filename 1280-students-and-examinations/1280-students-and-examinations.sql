SELECT s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams 
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
    ON e.subject_name=sub.subject_name 
    AND e.student_id=s.student_id
GROUP BY student_id, subject_name
ORDER BY student_id, subject_name;