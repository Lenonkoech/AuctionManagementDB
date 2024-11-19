-- Inserting a user, then try to insert another user with the same username
INSERT INTO Users (username, email) VALUES ('uniqueUser', 'user1@example.com');
INSERT INTO Users (username, email) VALUES ('uniqueUser', 'user2@example.com');