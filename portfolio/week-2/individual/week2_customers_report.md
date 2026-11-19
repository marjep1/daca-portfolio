# Week 2 – Customer Data Cleaning Report

## 1. Overview

The objective of this task was to identify data quality issues in the `customers_test` table and improve data consistency through data cleaning and standardization.

The analysis focused on duplicate records, missing values, inconsistent formatting of customer names and city names, and the consistency of email addresses and phone numbers.

The dataset contained **3,150 customer records**.

## 2. Data Quality Issues Identified

### Duplicate email addresses

Duplicate email addresses were identified and analyzed using SQL queries with `GROUP BY` and `HAVING`.

The analysis showed:

- Total records: 3,150
- Unique email addresses: 2,640
- Records with NULL email addresses: 380
- Empty email addresses: 0
- Records with duplicate email addresses: 130

Duplicate email addresses indicate potential duplicate customer records. These records require further investigation before any deletion is performed.

### Missing values

The following columns were checked for missing values:

| Column | Missing values |
|---|---:|
| `first_name` | 0 |
| `last_name` | 0 |
| `email` | 380 |
| `phone` | 0 |
| `city` | 0 |
| `registration_date` | 0 |
| `loyalty_tier` | 1,260 |
| `birth_year` | 0 |

The analysis identified missing email addresses and loyalty tier values.

### Inconsistent customer names

Customer first names and last names were checked for inconsistent formatting, including lowercase letters and unnecessary spaces.

Standardization was performed using `INITCAP()` and `TRIM()`.

### Inconsistent city names

City names were found in different formats, including lowercase, uppercase and inconsistent capitalization.

The analysis identified **54 different city name variants**.

These were standardized using `INITCAP()` and `TRIM()`, resulting in **12 standardized city names**.

A total of **252 records required city name standardization**.

### Email addresses

Email addresses were checked for inconsistent capitalization and unnecessary spaces using `LOWER()` and `TRIM()`.

No email addresses required standardization.

### Phone numbers

Phone numbers were checked against the standardization rules provided in the task guide.

No phone numbers required standardization.

## 3. Cleaning Actions Performed

The following cleaning actions were performed:

- Standardized first names using `INITCAP()` and `TRIM()`.
- Standardized last names using `INITCAP()` and `TRIM()`.
- Standardized city names using `INITCAP()` and `TRIM()`.
- Checked email addresses for unnecessary spaces and inconsistent capitalization.
- Checked phone numbers for inconsistent formatting.
- Identified duplicate email addresses.
- Identified missing values in relevant customer columns.
- Analyzed duplicate candidates based on first name and last name combinations.

## 4. Results

| Data quality issue | Action taken | Result |
|---|---|---|
| Inconsistent first names | Standardized using `INITCAP()` and `TRIM()` | Completed |
| Inconsistent last names | Standardized using `INITCAP()` and `TRIM()` | Completed |
| Inconsistent city names | Standardized using `INITCAP()` and `TRIM()` | 252 records standardized |
| City name variants | Identified and standardized | 54 variants reduced to 12 standardized names |
| Email formatting | Checked using `LOWER()` and `TRIM()` | No changes required |
| Phone number formatting | Checked against standardization rules | No changes required |
| Duplicate email addresses | Identified and analyzed | 130 duplicate records identified |
| Missing email addresses | Identified | 380 records |
| Missing loyalty tier | Identified | 1,260 records |
| Missing first names | Checked | 0 |
| Missing last names | Checked | 0 |
| Missing phone numbers | Checked | 0 |
| Missing registration dates | Checked | 0 |
| Missing birth years | Checked | 0 |

## 5. Duplicate Name Analysis

The analysis of first name and last name combinations identified:

- Unique first and last name combinations: **2,386**
- Duplicate name combinations: **764**

Repeated names were considered duplicate candidates rather than confirmed duplicate customer records, because different customers may have the same first and last name.

Further investigation using additional customer attributes would be required to confirm whether these records represent actual duplicates.

## 6. Conclusion

The customer dataset was reviewed for several data quality issues, including duplicate email addresses, missing values and inconsistent formatting.

The main cleaning actions performed were the standardization of customer names and city names.

City name standardization reduced **54 different variants to 12 standardized city names**, affecting **252 records**.

Email addresses and phone numbers were also checked, but no standardization was required for these fields.

The analysis identified **380 missing email addresses**, **1,260 missing loyalty tier values** and **130 records with duplicate email addresses**.

The duplicate name analysis identified **764 duplicate candidates**, which require further investigation before being considered actual duplicate customer records.

Overall, the cleaning process improved the consistency of the customer dataset and identified data quality issues that may require further attention.
