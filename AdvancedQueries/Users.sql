-- Query to provide a detailed bid history for a specific user, sorted by auction end times.
-- user_id = 1  
SELECT 
    a.title AS auction_title, 
    b.bid_amount, 
    b.created_at
FROM 
    Bids b
JOIN 
    Auctions a ON b.auction_id = a.auction_id
WHERE 
    b.bidder_id = 1  
ORDER BY 
    a.end_time DESC;