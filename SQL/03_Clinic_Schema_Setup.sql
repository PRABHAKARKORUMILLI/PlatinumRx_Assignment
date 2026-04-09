USE platinumrx_db;
-- CLINICS TABLE
-- CREATE TABLE clinics (
--     cid VARCHAR(50) PRIMARY KEY,
--     clinic_name VARCHAR(100),
--     city VARCHAR(50),
--     state VARCHAR(50),
--     country VARCHAR(50)
-- ) ENGINE=InnoDB;

-- CUSTOMER TABLE
-- CREATE TABLE customer (
--     uid VARCHAR(50) PRIMARY KEY,
--     name VARCHAR(100),
--     mobile VARCHAR(20)
-- ) ENGINE=InnoDB;

-- CLINIC SALES TABLE
-- CREATE TABLE clinic_sales (
--     oid VARCHAR(50) PRIMARY KEY,
--     uid VARCHAR(50),
--     cid VARCHAR(50),
--     amount INT,
--     datetime DATETIME,
--     sales_channel VARCHAR(50),
--     FOREIGN KEY (uid) REFERENCES customer(uid),
--     FOREIGN KEY (cid) REFERENCES clinics(cid)
-- ) ENGINE=InnoDB;

-- EXPENSES TABLE
-- CREATE TABLE expenses (
--     eid VARCHAR(50) PRIMARY KEY,
--     cid VARCHAR(50),
--     description TEXT,
--     amount INT,
--     datetime DATETIME,
--     FOREIGN KEY (cid) REFERENCES clinics(cid)
-- ) ENGINE=InnoDB;

-- SAMPLE DATA
-- INSERT INTO clinics VALUES
-- ('C1','Clinic A','Hyderabad','Telangana','India'),
-- ('C2','Clinic B','Mumbai','Maharashtra','India');

-- INSERT INTO customer VALUES
-- ('U1','John','9999999999'),
-- ('U2','Jane','8888888888'),
-- ('U3','Alex','7777777777');

-- INSERT INTO clinic_sales VALUES
-- ('O1','U1','C1',5000,'2021-09-10 10:00:00','online'),
-- ('O2','U2','C2',8000,'2021-09-15 12:00:00','offline'),
-- ('O3','U3','C1',7000,'2021-10-05 11:00:00','online'),
-- ('O4','U1','C2',6000,'2021-10-20 14:00:00','offline');
-- INSERT INTO expenses VALUES
-- ('E1','C1','supplies',2000,'2021-09-10 09:00:00'),
-- ('E2','C2','rent',3000,'2021-09-15 08:00:00'),
-- ('E3','C1','equipment',2500,'2021-10-05 09:00:00'),
-- ('E4','C2','maintenance',2000,'2021-10-20 10:00:00');

SELECT * FROM clinics;
SELECT * FROM customer;
SELECT * FROM clinic_sales;
SELECT * FROM expenses;