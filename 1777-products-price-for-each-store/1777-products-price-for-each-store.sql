SELECT product_id,
    SUM(IF(store="store1",price,null))AS store1,
    SUM(IF(store="store2",price,null))AS store2,
    SUM(IF(store="store3",price,null))AS store3
FROM Products 
GROUP BY product_id;