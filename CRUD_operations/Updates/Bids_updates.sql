-- Update bid amount on bid one by bidder one
UPDATE Bids
SET bid_amount = 340, created_at = NOW()
WHERE bid_id = 1;
