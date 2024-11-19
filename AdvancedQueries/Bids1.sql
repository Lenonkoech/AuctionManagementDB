-- Query to find all bids that are above the average bid amount for their respective auctions. 
SELECT 
    b.bid_id, 
    b.bidder_id, 
    b.auction_id, 
    b.bid_amount
FROM 
    Bids b
WHERE 
    b.bid_amount > (
        SELECT AVG(bid_amount)
        FROM Bids
        WHERE auction_id = b.auction_id
    );