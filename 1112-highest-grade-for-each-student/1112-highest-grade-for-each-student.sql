SELECT student_id, 
course_id, 
grade

FROM (SELECT e.*, 
      RANK() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS rnk 
	  FROM enrollments e) x
	 
WHERE x.rnk = 1
ORDER BY student_id ASC

# select the three columns we need for output
#sub query and rank window function to rank the grades from highest to lowest
# order the grades biggest to smallest and then course id smallest to biggest incase there is a tie
#filter where the grade rank is 1 (highest grade)
#ordered based on what the question asked