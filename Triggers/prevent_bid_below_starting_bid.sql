DELIMITER //

CREATE TRIGGER prevent_bid_below_starting_bid
BEFORE INSERT ON Bids
FOR EACH ROW
BEGIN
    DECLARE starting_bid DECIMAL(10, 2);

    -- Retrieve the starting bid of the auction
    SELECT starting_bid 
    INTO starting_bid 
    FROM Auctions 
    WHERE auction_id = NEW.auction_id;

    -- Check if the new bid amount is lower than the starting bid
    IF (NEW.bid_amount < starting_bid) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Bid amount cannot be lower than the starting bid of the auction.';
    END IF;
END 
//
DELIMITER ;