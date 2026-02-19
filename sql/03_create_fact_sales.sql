DROP TABLE IF EXISTS fact_sales;

CREATE TABLE fact_sales (
    row_id INT,
    customer_id INT,
    product_id INT,
    region_id INT,
    date_id INT,
    Sales DECIMAL(12,2),
    Quantity INT,
    Profit DECIMAL(12,2),
    Discount DECIMAL(5,2),
    order_id VARCHAR(50),
    ship_date DATE,
    ship_mode VARCHAR(50)
);
