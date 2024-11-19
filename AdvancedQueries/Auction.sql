-- Query to find auctions that have bids in them (Bidded Auctions)
SELECT 
    a.auction_id, 
    a.title, 
    GROUP_CONCAT(u.username) AS bidders
FROM 
    Auctions a
JOIN 
    Bids b ON a.auction_id = b.auction_id
JOIN 
    Users u ON b.bidder_id = u.user_id
GROUP BY 
    a.auction_id, a.title;