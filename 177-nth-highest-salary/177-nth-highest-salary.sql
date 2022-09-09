CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      SELECT CASE WHEN COUNT(*)>0 THEN s.salary 
                ELSE null END AS getNthHighestSalary
      FROM (SELECT dense_rank() over (ORDER BY salary DESC) AS ranking, salary FROM Employee) s
      WHERE s.ranking = N
     
      );
      
END