USE sales_dw;

-- =====================================================
-- DIM CUSTOMER
-- =====================================================
DROP TABLE IF EXISTS dim_customer;

CREATE TABLE dim_customer AS
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY `Customer ID`) AS customer_id,
    `Customer ID` AS customer_key,
    `Customer Name` AS customer_name,
    Segment
FROM stg_superstore;


-- =====================================================
-- DIM PRODUCT
-- =====================================================
DROP TABLE IF EXISTS dim_product;

CREATE TABLE dim_product AS
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY `Product ID`) AS product_id,
    `Product ID` AS product_key,
    `Product Name` AS product_name,
    Category,
    `Sub-Category` AS sub_category
FROM stg_superstore;


-- =====================================================
-- DIM REGION
-- =====================================================
DROP TABLE IF EXISTS dim_region;

CREATE TABLE dim_region AS
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY Region, State, City) AS region_id,
    Country,
    State,
    City,
    Region,
    `Postal Code` AS postal_code
FROM stg_superstore;


-- =====================================================
-- DIM DATE  ✅ FIXED WITH STR_TO_DATE
-- =====================================================
DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_date AS
SELECT DISTINCT
    ROW_NUMBER() OVER (
        ORDER BY STR_TO_DATE(`Order Date`, '%m/%d/%Y')
    ) AS date_id,

    STR_TO_DATE(`Order Date`, '%m/%d/%Y') AS order_date,

    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS order_year,
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS order_month,
    DAY(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS order_day,
    QUARTER(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS order_quarter

FROM stg_superstore;
