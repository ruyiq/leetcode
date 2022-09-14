SELECT book_id, b.name               
FROM Orders o
JOIN Books b
    USING(book_id)
WHERE b.available_from <= date_sub('2019-06-23', interval 1 month) and o.dispatch_date between date_sub('2019-06-23', interval 1 year) and '2019-06-23'
GROUP BY book_id 
HAVING SUM(quantity)<10

UNION

SELECT book_id, name               
FROM Books
LEFT JOIN Orders o
    USING(book_id)
WHERE book_id NOT IN (SELECT book_id FROM Orders WHERE dispatch_date between date_sub('2019-06-23', interval 1 year) and '2019-06-23') 
