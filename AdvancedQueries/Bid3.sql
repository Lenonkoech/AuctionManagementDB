-- Query to get the avaerage Bid amount for each Auction
SELECT 
    a.auction_id, 
    a.title, 
    AVG(b.bid_amount) AS average_bid_amount
FROM 
    Auctions a
JOIN 
    Bids b ON a.auction_id = b.auction_id
GROUP BY 
    a.auction_id, a.title; 