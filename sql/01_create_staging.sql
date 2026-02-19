-- =====================================================
-- 01_create_staging.sql
-- Purpose: Create raw staging table and load CSV
-- =====================================================

-- Use database
CREATE DATABASE IF NOT EXISTS sales_dw;
USE sales_dw;

-- -----------------------------------------------------
-- Drop if exists (makes pipeline rerunnable)
-- -----------------------------------------------------
DROP TABLE IF EXISTS stg_superstore;

-- -----------------------------------------------------
-- Create staging table (raw structure)
-- NOTE: Dates kept as TEXT intentionally (raw zone)
-- -----------------------------------------------------
CREATE TABLE stg_superstore (
    `Row ID` INT,
    `Order ID` VARCHAR(50),
    `Order Date` TEXT,
    `Ship Date` TEXT,
    `Ship Mode` VARCHAR(50),
    `Customer ID` VARCHAR(20),
    `Customer Name` VARCHAR(100),
    `Segment` VARCHAR(50),
    `Country` VARCHAR(50),
    `City` VARCHAR(50),
    `State` VARCHAR(50),
    `Postal Code` VARCHAR(20),
    `Region` VARCHAR(20),
    `Product ID` VARCHAR(50),
    `Category` VARCHAR(50),
    `Sub-Category` VARCHAR(50),
    `Product Name` VARCHAR(150),
    `Sales` DOUBLE,
    `Quantity` INT,
    `Discount` DOUBLE,
    `Profit` DOUBLE
);
