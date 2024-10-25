CREATE TABLE Ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    seller_id INT,
    buyer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    FOREIGN KEY (seller_id) REFERENCES Users(user_id),
    FOREIGN KEY (buyer_id) REFERENCES Users(user_id)
);
-- comment first part when executing 2nd part
-- add created at timestamp  
alter table Ratings add column created_at timestamp DEFAULT CURRENT_TIMESTAMP;