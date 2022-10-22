select 'Low Salary' as category, sum(case when income < 20000 then 1 else 0 end) as accounts_count from accounts
UNION
select 'High Salary' as category, sum(case when income > 50000 then 1 else 0 end) as accounts_count from accounts
UNION
select 'Average Salary' as category, sum(case when income >= 20000 and income <= 50000 then 1 else 0 end) as accounts_count from accounts