-- Query to get users with the most bids and arrange in decending order.  
SELECT 
    u.user_id, 
    u.username, 
    COUNT(b.bid_id) AS total_bids
FROM 
    Users u
LEFT JOIN 
    Bids b ON u.user_id = b.bidder_id
GROUP BY 
    u.user_id, 
    u.username
ORDER BY 
    total_bids DESC;