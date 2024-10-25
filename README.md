# Auction Management Database

This repository contains the SQL files for an Auction Management System. 
The database design supports user management, auction listings, bidding, payment processing, and user ratings.

## Database Overview

The auction management database consists of six main tables:

1. **Users**
2. **Auctions**
3. **Bids**
4. **Categories**
5. **Payments**
6. **Ratings**

### Table Descriptions

#### Users Table

Stores information about users, including buyers, sellers, and administrators.

- `user_id`: Unique identifier for the user (Primary Key).
- `username`: Unique username for login purposes.
- `email`: Unique email address for account communication.
- `password_hash`: Securely stored password hash.
- `created_at`: Timestamp of account creation.
- `updated_at`: Timestamp for tracking updates.
- `role`: User role (admin, seller, buyer).

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

#### Ratings Table

Stores ratings and comments given by buyers to sellers after a transaction.

- `rating_id`: Unique identifier for each rating (Primary Key).
- `seller_id`: Reference to the user receiving the rating (Foreign Key).
- `buyer_id`: Reference to the user giving the rating (Foreign Key).
- `rating`: Numeric rating value between 1 and 5.
- `comment`: Optional comment accompanying the rating.
- `created_at`: Timestamp of when the rating was given.

## Relationships

- **Users** can create multiple **Auctions**.
- **Auctions** can have multiple **Bids**.
- **Users** can place multiple **Bids**.
- Each **Auction** belongs to one **Category**.
- **Users** can have multiple **Payments**.
- **Users** can leave multiple **Ratings** for different sellers.

## Setup

1. Clone the repository in your project directory:
   ```git clone https://github.com/Lenonkoech/auctionManagementDB.git```
