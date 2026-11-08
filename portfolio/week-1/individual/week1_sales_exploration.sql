-- =====================================================
-- WEEK 1: SALES DATA EXPLORATION
-- Author: Individual SQL exploration
-- Database: UrbanStyle
--
-- Objective:
-- Explore sales data, identify duplicate records
-- and assess potential data quality issues.
--
-- IMPORTANT:
-- This analysis is read-only.
-- No data is modified or deleted.
-- =====================================================


-- =====================================================
-- QUERY 1: SALES DATA OVERVIEW
-- Purpose:
-- Get a general overview of the sales dataset.
-- =====================================================

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT sale_id) AS unique_sales,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(DISTINCT product_id) AS unique_products
FROM sales;


-- Finding:
-- The sales table contains 15,234 rows,
-- 10,118 unique sale IDs,
-- 2,558 unique customers
-- and 350 unique products.
--
-- The difference between total rows and unique sale IDs
-- indicates repeated sale IDs that require further investigation.

-- =====================================================
-- QUERY 2: IDENTIFY DUPLICATE SALE IDs
-- Purpose:
-- Identify sale IDs that appear more than once
-- and count their occurrences.
-- =====================================================

SELECT
    sale_id,
    COUNT(*) AS occurrence_count
FROM sales
GROUP BY sale_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC
LIMIT 20;


-- Finding:
-- Multiple occurrences of the same sale ID were identified.
-- Some sale IDs appear up to 6 times.
-- Further investigation is required to determine
-- whether these are exact duplicate records.

-- =====================================================
-- QUERY 3: INSPECT A DUPLICATE SALE ID
-- Purpose:
-- Examine all records associated with one repeated
-- sale ID to determine whether their business data
-- is identical.
-- =====================================================

SELECT *
FROM sales
WHERE sale_id = 4256
ORDER BY id;


-- Finding:
-- Sale ID 4256 appears 6 times.
-- All six records have identical business attributes,
-- including invoice, date, customer, product,
-- quantity, prices, channel, location and payment method.
-- Only the technical record ID differs.
--
-- This indicates exact duplicate records
-- based on the business attributes.

-- =====================================================
-- QUERY 4: IDENTIFY EXACT DUPLICATE RECORDS
-- Purpose:
-- Identify groups of records with identical business
-- attributes across the entire sales dataset.
-- =====================================================

SELECT
    sale_id,
    invoice_id,
    sale_date,
    customer_id,
    product_id,
    quantity,
    unit_price,
    total_price,
    channel,
    store_location,
    payment_method,
    COUNT(*) AS occurrence_count
FROM sales
GROUP BY
    sale_id,
    invoice_id,
    sale_date,
    customer_id,
    product_id,
    quantity,
    unit_price,
    total_price,
    channel,
    store_location,
    payment_method
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC
LIMIT 20;


-- Finding:
-- Multiple groups of exact duplicate records were identified.
-- The analysis shows that repeated sale IDs are not
-- always the only issue: some records are identical
-- across all business attributes.

-- =====================================================
-- QUERY 5: MEASURE THE IMPACT OF EXACT DUPLICATES
-- Purpose:
-- Quantify the number of duplicate groups,
-- records in those groups and excess duplicate rows.
-- =====================================================

WITH duplicate_groups AS (
    SELECT COUNT(*) AS occurrence_count
    FROM sales
    GROUP BY
        sale_id,
        invoice_id,
        sale_date,
        customer_id,
        product_id,
        quantity,
        unit_price,
        total_price,
        channel,
        store_location,
        payment_method
    HAVING COUNT(*) > 1
)

SELECT
    COUNT(*) AS duplicate_groups,
    SUM(occurrence_count) AS rows_in_duplicate_groups,
    SUM(occurrence_count - 1) AS excess_duplicate_rows
FROM duplicate_groups;


-- Finding:
-- 3,456 duplicate groups were identified.
-- These groups contain 7,759 records in total.
-- 4,303 records are excess occurrences beyond
-- the first record in each group.

