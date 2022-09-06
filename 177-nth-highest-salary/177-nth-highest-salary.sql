CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
RETURN (
select
salary
from (
select salary,
dense_rank()over( order by salary desc) pp
from employee) gg
where pp = N
limit 1

);
END