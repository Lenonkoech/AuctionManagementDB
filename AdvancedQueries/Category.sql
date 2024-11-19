-- This query sums up the total revenue generated from completed auctions, categorized by auction category. 
SELECT 
    c.name, 
    SUM(p.amount) AS total_revenue
FROM 
    Categories c
JOIN 
    Auctions a ON c.category_id = a.category_id
JOIN 
    Payments p ON a.auction_id = p.auction_id
WHERE 
    p.status = 'completed'
GROUP BY 
    c.name;