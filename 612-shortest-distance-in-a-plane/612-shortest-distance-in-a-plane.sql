SELECT ROUND(SQRT((a.x-b.x)*(a.x-b.x)+(a.y-b.y)*(a.y-b.y)),2) AS shortest 
FROM Point2D a, Point2D b
WHERE a.x <> b.x OR a.y<>b.y
ORDER BY shortest
LIMIT 1