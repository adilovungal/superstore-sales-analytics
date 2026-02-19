USE sales_dw;

DROP VIEW IF EXISTS vw_sales_analytics;

CREATE VIEW vw_sales_analytics AS
SELECT
    f.row_id,
    f.order_id,
    f.ship_mode,

    -- Measures
    f.Sales,
    f.Quantity,
    f.Profit,
    f.Discount,

    -- Customer
    dc.customer_name,
    dc.segment,

    -- Product
    dp.category,
    dp.sub_category,
    dp.product_name,

    -- Region
    dr.Region,
    dr.State,
    dr.City,

    -- Date attributes
    dd.order_date,
    dd.year,
    dd.month,
    dd.quarter

FROM fact_sales f
JOIN dim_customer dc ON f.customer_id = dc.customer_id
JOIN dim_product dp  ON f.product_id = dp.product_id
JOIN dim_region dr   ON f.region_id = dr.region_id
JOIN dim_date dd     ON f.date_id = dd.date_id;
