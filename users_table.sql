CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'seller', 'buyer') NOT NULL,
    firstName varchar(20),
    lastName varchar(20),
    DOB date,
    postalAdress varchar(40),
    phoneNumber varchar(15)
);
