# Write your MySQL query statement below
# 思路:用窗口函数找rank为2的

SELECT CASE WHEN COUNT(*) > 0 THEN salary
            ELSE NULL END AS SecondHighestSalary
FROM (
    SELECT salary,dense_rank() over (order by salary desc) as ranking from Employee
) s
WHERE s.ranking=2;