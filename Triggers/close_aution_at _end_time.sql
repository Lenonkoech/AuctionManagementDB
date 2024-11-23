DELIMITER //

CREATE TRIGGER CheckAuctionEnd
AFTER INSERT ON Bids  -- or any other table that should trigger this action
FOR EACH ROW
BEGIN
    DECLARE auction_end_time DATETIME;

    -- Get the end time of the auction
    SELECT end_time INTO auction_end_time
    FROM Auctions
    WHERE auction_id = NEW.auction_id;

    -- Check if the current time exceeds the auction's end time
    IF NOW() > auction_end_time THEN
        -- Update the auction status to closed
        UPDATE Auctions
        SET auction_status = 'closed'
        WHERE auction_id = NEW.auction_id;
    END IF;
END //

DELIMITER ;
