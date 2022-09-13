SELECT p.product_name, SUM(o.unit) AS unit
from Orders o join Products p on o.product_id=p.product_id
WHERE year(order_date) = 2020 and month(order_date) = 2
group by product_name
having sum(unit) >= 100;