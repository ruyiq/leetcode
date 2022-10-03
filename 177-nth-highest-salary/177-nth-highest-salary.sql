CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      SELECT CASE WHEN COUNT(salary)=0 THEN null
        ELSE salary END AS getNthHighestSalary
      FROM (SELECT *, dense_rank() over (ORDER BY salary DESC) ranking FROM Employee) s
      WHERE ranking=N
      
  );
END