USE platinumrx_db;
-- Q1: Last booked room per user
-- SELECT b.user_id, b.room_no
-- FROM bookings b
-- JOIN (
--     SELECT user_id, MAX(booking_date) AS last_date
--     FROM bookings
--     GROUP BY user_id
-- ) t
-- ON b.user_id = t.user_id 
-- AND b.booking_date = t.last_date;

-- Q2: Booking ID & total billing (Nov 2021)
-- SELECT 
--     b.booking_id,
--     SUM(bc.item_quantity * i.item_rate) AS total_amount
-- FROM bookings b
-- JOIN booking_commercials bc ON b.booking_id = bc.booking_id
-- JOIN items i ON bc.item_id = i.item_id
-- WHERE YEAR(b.booking_date) = 2021 
--   AND MONTH(b.booking_date) = 11
-- GROUP BY b.booking_id;

-- Q3: Bills > 1000 (October 2021)
-- SELECT 
--     bc.bill_id,
--     SUM(bc.item_quantity * i.item_rate) AS bill_amount
-- FROM booking_commercials bc
-- JOIN items i ON bc.item_id = i.item_id
-- WHERE YEAR(bc.bill_date) = 2021
--   AND MONTH(bc.bill_date) = 10
-- GROUP BY bc.bill_id
-- HAVING SUM(bc.item_quantity * i.item_rate) > 1000;

-- Q4: Most & Least ordered item per month
-- SELECT 
--     t1.month,
--     t1.item_name,
--     t1.total_qty
-- FROM (
--     SELECT 
--         MONTH(bc.bill_date) AS month,
--         i.item_name,
--         SUM(bc.item_quantity) AS total_qty
--     FROM booking_commercials bc
--     JOIN items i ON bc.item_id = i.item_id
--     WHERE YEAR(bc.bill_date) = 2021
--     GROUP BY MONTH(bc.bill_date), i.item_name
-- ) t1
-- JOIN (
--     SELECT 
--         month,
--         MAX(total_qty) AS max_qty
--     FROM (
--         SELECT 
--             MONTH(bc2.bill_date) AS month,
--             bc2.item_id,
--             SUM(bc2.item_quantity) AS total_qty
--         FROM booking_commercials bc2
--         WHERE YEAR(bc2.bill_date) = 2021
--         GROUP BY MONTH(bc2.bill_date), bc2.item_id
--     ) t
--     GROUP BY month
-- ) t2
-- ON t1.month = t2.month 
-- AND t1.total_qty = t2.max_qty;


-- SELECT 
--     t1.month,
--     t1.item_name,
--     t1.total_qty
-- FROM (
--     SELECT 
--         MONTH(bc.bill_date) AS month,
--         i.item_name,
--         SUM(bc.item_quantity) AS total_qty
--     FROM booking_commercials bc
--     JOIN items i ON bc.item_id = i.item_id
--     WHERE YEAR(bc.bill_date) = 2021
--     GROUP BY MONTH(bc.bill_date), i.item_name
-- ) t1
-- JOIN (
--     SELECT 
--         month,
--         MIN(total_qty) AS min_qty
--     FROM (
--         SELECT 
--             MONTH(bc2.bill_date) AS month,
--             bc2.item_id,
--             SUM(bc2.item_quantity) AS total_qty
--         FROM booking_commercials bc2
--         WHERE YEAR(bc2.bill_date) = 2021
--         GROUP BY MONTH(bc2.bill_date), bc2.item_id
--     ) t
--     GROUP BY month
-- ) t2
-- ON t1.month = t2.month 
-- AND t1.total_qty = t2.min_qty;

-- Q5: Second highest bill per month
SELECT month, bill_id, total_bill
FROM (
    SELECT 
        MONTH(bc.bill_date) AS month,
        bc.bill_id,
        SUM(bc.item_quantity * i.item_rate) AS total_bill
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY MONTH(bc.bill_date), bc.bill_id
) t1
WHERE 1 = (
    SELECT COUNT(DISTINCT t2.total_bill)
    FROM (
        SELECT 
            MONTH(bc.bill_date) AS month,
            bc.bill_id,
            SUM(bc.item_quantity * i.item_rate) AS total_bill
        FROM booking_commercials bc
        JOIN items i ON bc.item_id = i.item_id
        WHERE YEAR(bc.bill_date) = 2021
        GROUP BY MONTH(bc.bill_date), bc.bill_id
    ) t2
    WHERE t2.month = t1.month
      AND t2.total_bill > t1.total_bill
);