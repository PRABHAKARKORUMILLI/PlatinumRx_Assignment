USE platinumrx_db;
-- Q1: Revenue by sales channel (2021)
SELECT 
    sales_channel,
    SUM(amount) AS total_revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;

-- Q2: Top 10 customers

-- SELECT 
--     uid,
--     SUM(amount) AS total_spent
-- FROM clinic_sales
-- WHERE YEAR(datetime) = 2021
-- GROUP BY uid
-- ORDER BY total_spent DESC
-- LIMIT 10;

-- Q3: Month-wise revenue, expense, profit

-- SELECT 
--     r.month,
--     r.revenue,
--     e.expense,
--     (r.revenue - e.expense) AS profit,
--     CASE 
--         WHEN (r.revenue - e.expense) > 0 THEN 'Profitable'
--         ELSE 'Not Profitable'
--     END AS status
-- FROM (
--     SELECT 
--         MONTH(datetime) AS month,
--         SUM(amount) AS revenue
--     FROM clinic_sales
--     WHERE YEAR(datetime) = 2021
--     GROUP BY MONTH(datetime)
-- ) r
-- JOIN (
--     SELECT 
--         MONTH(datetime) AS month,
--         SUM(amount) AS expense
--     FROM expenses
--     WHERE YEAR(datetime) = 2021
--     GROUP BY MONTH(datetime)
-- ) e
-- ON r.month = e.month;
-- Q4: Most profitable clinic per city (month = 9)

-- SELECT t1.city, t1.cid, t1.profit
-- FROM (
--     SELECT 
--         c.city,
--         cs.cid,
--         SUM(cs.amount) - IFNULL(SUM(e.amount),0) AS profit
--     FROM clinic_sales cs
--     JOIN clinics c ON cs.cid = c.cid
--     LEFT JOIN expenses e 
--         ON cs.cid = e.cid 
--         AND MONTH(cs.datetime) = MONTH(e.datetime)
--     WHERE MONTH(cs.datetime) = 9
--     GROUP BY c.city, cs.cid
-- ) t1
-- WHERE profit = (
--     SELECT MAX(t2.profit)
--     FROM (
--         SELECT 
--             c.city,
--             cs.cid,
--             SUM(cs.amount) - IFNULL(SUM(e.amount),0) AS profit
--         FROM clinic_sales cs
--         JOIN clinics c ON cs.cid = c.cid
--         LEFT JOIN expenses e 
--             ON cs.cid = e.cid 
--             AND MONTH(cs.datetime) = MONTH(e.datetime)
--         WHERE MONTH(cs.datetime) = 9
--         GROUP BY c.city, cs.cid
--     ) t2
--     WHERE t2.city = t1.city
-- );

-- Q5: Second least profitable clinic per state (month = 10)

-- SELECT t1.state, t1.cid, t1.profit
-- FROM (
--     SELECT 
--         c.state,
--         cs.cid,
--         SUM(cs.amount) - IFNULL(SUM(e.amount),0) AS profit
--     FROM clinic_sales cs
--     JOIN clinics c ON cs.cid = c.cid
--     LEFT JOIN expenses e 
--         ON cs.cid = e.cid 
--         AND MONTH(cs.datetime) = MONTH(e.datetime)
--     WHERE MONTH(cs.datetime) = 10
--     GROUP BY c.state, cs.cid
-- ) t1
-- WHERE 1 = (
--     SELECT COUNT(DISTINCT t2.profit)
--     FROM (
--         SELECT 
--             c.state,
--             cs.cid,
--             SUM(cs.amount) - IFNULL(SUM(e.amount),0) AS profit
--         FROM clinic_sales cs
--         JOIN clinics c ON cs.cid = c.cid
--         LEFT JOIN expenses e 
--             ON cs.cid = e.cid 
--             AND MONTH(cs.datetime) = MONTH(e.datetime)
--         WHERE MONTH(cs.datetime) = 10
--         GROUP BY c.state, cs.cid
--     ) t2
--     WHERE t2.state = t1.state
--       AND t2.profit < t1.profit
-- );