select
    o.book_id,
    b.name
from Orders as o
left join Books as b on o.book_id = b.book_id
where b.available_from <= date_sub('2019-06-23', interval 1 month) 
    and o.dispatch_date between date_sub('2019-06-23', interval 1 year) and '2019-06-23'
group by o.book_id, b.name
having sum(o.quantity) < 10

union

select
    book_id,
    name
from Books
where available_from <= date_sub('2019-06-23', interval 1 month) and book_id not in 
(
    select book_id 
    from Orders 
    where dispatch_date between date_sub('2019-06-23', interval 1 year) and '2019-06-23'
)