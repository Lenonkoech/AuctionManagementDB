-- This query counts the number of bids placed during each hour of the day. 
SELECT 
    HOUR(b.created_at) AS bid_hour, 
    COUNT(b.bid_id) AS bid_count
FROM 
    Bids b
GROUP BY 
    bid_hour
ORDER BY 
    bid_hour;