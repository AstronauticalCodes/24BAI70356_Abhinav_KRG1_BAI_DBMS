SELECT 
    p.prod_id, 
    COUNT(od.order_id) AS TotalOrders
FROM Tbl_Products p
JOIN Tbl_Orders od ON p.prod_id = od.prod_id
GROUP BY p.prod_name