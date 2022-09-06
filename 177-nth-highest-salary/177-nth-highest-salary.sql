#还是用窗口函数dense_rank.

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      SELECT salary
      FROM (
           select salary, 
           dense_rank()over( order by salary desc) ranking
           From employee) s
           WHERE ranking = N
           LIMIT 1
  ); 
END