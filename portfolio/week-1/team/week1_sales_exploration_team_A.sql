-- =====================================================
-- DACA | Week 1 Group Work
-- Role A: Sales Data Explorer
-- Table: sales
-- Purpose: Explore sales transactions, amounts and dates
-- =====================================================


-- 1. Count total number of sales records
SELECT
    COUNT(*) AS total_sales_records
FROM sales;


-- 2. Explore table structure and sample records
SELECT *
FROM sales
LIMIT 10;


-- 3. Find the largest sales transactions
SELECT *
FROM sales
ORDER BY total_price DESC
LIMIT 10;


-- 4. Find the smallest sales transactions
-- Check whether there are zero or negative transaction amounts
SELECT *
FROM sales
ORDER BY total_price ASC
LIMIT 10;


-- 5. Identify records with missing customer information
SELECT
    COUNT(*) - COUNT(customer_id) AS records_without_customer_id
FROM sales;


-- =====================================================
-- Additional analysis:
-- =====================================================

-- 1. Monthly sales overview

SELECT
    DATE_TRUNC('month', sale_date)::DATE AS month,
    COUNT(*) AS sales_records,
    SUM(total_price) AS total_sales_amount,
    ROUND(AVG(total_price), 2) AS average_transaction
FROM sales
WHERE sale_date IS NOT NULL
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY month;


-- 2. Check sales quantities
SELECT
    COUNT(*) FILTER (WHERE quantity = 0) AS zero_quantity,
    COUNT(*) FILTER (WHERE quantity < 0) AS negative_quantity,
    COUNT(*) FILTER (WHERE quantity > 0) AS positive_quantity
FROM sales;


-- 3. Check sales amounts
SELECT
    COUNT(*) FILTER (WHERE total_price = 0) AS zero_amount,
    COUNT(*) FILTER (WHERE total_price < 0) AS negative_amount,
    COUNT(*) FILTER (WHERE total_price > 0) AS positive_amount
FROM sales;
