-- CREATE DATABASE platinumrx_db;
-- USE platinumrx_db;
-- CREATE TABLE users (
--     user_id VARCHAR(50) PRIMARY KEY,
--     name VARCHAR(100),
--     phone_number VARCHAR(20),
--     mail_id VARCHAR(100),
--     billing_address TEXT
-- ) ENGINE=InnoDB;
-- CREATE TABLE bookings (
--     booking_id VARCHAR(50) PRIMARY KEY,
--     booking_date DATETIME,
--     room_no VARCHAR(50),
--     user_id VARCHAR(50),
--     FOREIGN KEY (user_id) REFERENCES users(user_id)
-- ) ENGINE=InnoDB;
-- ITEMS TABLE
-- CREATE TABLE items (
--     item_id VARCHAR(50) PRIMARY KEY,
--     item_name VARCHAR(100),
--     item_rate INT
-- ) ENGINE=InnoDB;
-- BOOKING COMMERCIALS TABLE
-- CREATE TABLE booking_commercials (
--     id VARCHAR(50) PRIMARY KEY,
--     booking_id VARCHAR(50),
--     bill_id VARCHAR(50),
--     bill_date DATETIME,
--     item_id VARCHAR(50),
--     item_quantity FLOAT,
--     FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
--     FOREIGN KEY (item_id) REFERENCES items(item_id)
-- ) ENGINE=InnoDB;
-- SAMPLE DATA

-- INSERT INTO users VALUES 
-- ('U1','John Doe','9876543210','john@mail.com','Address1'),
-- ('U2','Jane Smith','9123456780','jane@mail.com','Address2'),
-- ('U3','Alex','9012345678','alex@mail.com','Address3');

-- INSERT INTO bookings VALUES
-- ('B1','2021-10-10 10:00:00','R1','U1'),
-- ('B2','2021-11-15 12:00:00','R2','U2'),
-- ('B3','2021-11-20 14:00:00','R3','U1'),
-- ('B4','2021-11-25 16:00:00','R4','U3');

-- INSERT INTO items VALUES
-- ('I1','Paratha',20),
-- ('I2','Curry',100),
-- ('I3','Rice',50);
-- INSERT INTO booking_commercials VALUES
-- ('C1','B1','BL1','2021-10-10 12:00:00','I1',10),   
-- ('C2','B2','BL2','2021-11-15 13:00:00','I2',5),    
-- ('C3','B3','BL3','2021-11-20 15:00:00','I1',30),   
-- ('C4','B4','BL4','2021-11-25 17:00:00','I3',50);   
-- SELECT * FROM users;
SELECT * FROM bookings;
SELECT * FROM items;
SELECT * FROM booking_commercials;