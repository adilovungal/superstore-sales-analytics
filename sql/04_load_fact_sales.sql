-- Optional performance indexes
CREATE INDEX idx_stg_customer ON stg_superstore(`Customer ID`);
CREATE INDEX idx_stg_product  ON stg_superstore(`Product ID`);
CREATE INDEX idx_stg_region   ON stg_superstore(Region, State, City);

-- Clear fact
TRUNCATE TABLE fact_sales;

-- Load fact
INSERT INTO fact_sales
SELECT
    s.`Row ID`,
    dc.customer_id,
    dp.product_id,
    dr.region_id,
    dd.date_id,
    CAST(s.Sales AS DECIMAL(12,2)),
    s.Quantity,
    CAST(s.Profit AS DECIMAL(12,2)),
    s.Discount,
    s.`Order ID`,
    STR_TO_DATE(s.`Ship Date`, '%m/%d/%Y'),
    s.`Ship Mode`
FROM stg_superstore s
JOIN dim_customer dc
    ON s.`Customer ID` = dc.customer_key
JOIN dim_product dp
    ON s.`Product ID` = dp.product_key
JOIN dim_region dr
    ON s.Region = dr.Region
   AND s.State = dr.State
   AND s.City = dr.City
JOIN dim_date dd
    ON STR_TO_DATE(s.`Order Date`, '%m/%d/%Y') = dd.order_date;
