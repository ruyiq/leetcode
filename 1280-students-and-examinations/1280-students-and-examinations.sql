# Write your MySQL query statement below
SELECT stu.student_id, stu.student_name, sub.subject_name, IFNULL(COUNT(e.subject_name),0) AS attended_exams 
FROM Students stu
cross join Subjects sub
LEFT JOIN Examinations e
    ON stu.student_id = e.student_id  and sub.subject_name = e.subject_name
GROUP BY student_id, subject_name
ORDER BY student_id, subject_name;