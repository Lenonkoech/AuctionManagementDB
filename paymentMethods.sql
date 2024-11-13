create table paymentMethods(paymId int primary key auto_increment,
 user_id int, type enum('M-Pesa','Paypal','Card','other'), 
 details varchar(40), 
 holderName varchar(40),
 expiryDate date,
 CVV int);