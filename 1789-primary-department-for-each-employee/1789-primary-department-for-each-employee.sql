SELECT employee_id,
CASE WHEN COUNT(employee_id)=1 THEN department_id
    ELSE sum(if(primary_flag='Y',department_id,0)) END AS department_id
FROM Employee
GROUP BY employee_id;