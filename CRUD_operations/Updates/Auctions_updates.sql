-- Update current bid of Bid one
UPDATE Auctions
SET current_bid = 340, updated_at = NOW()
WHERE auction_id = 1;