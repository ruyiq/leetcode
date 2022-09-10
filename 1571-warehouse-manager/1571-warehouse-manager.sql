SELECT w.name AS warehouse_name, SUM(p.width*p.length*p.height*w.units) AS volume     
FROM Warehouse w
JOIN Products p
    USING(product_id)
GROUP BY w.name;