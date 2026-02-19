#Total_Sales_Overview
SELECT
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    SUM(Quantity) AS total_quantity
FROM fact_sales;
#Sales_by_year
SELECT
    dd.year,
    SUM(f.Sales) AS yearly_sales
FROM fact_sales f
JOIN dim_date dd ON f.date_id = dd.date_id
GROUP BY dd.year
ORDER BY dd.year;
#top_10_products_by_sale
SELECT
    dp.product_name,
    SUM(f.Sales) AS total_sales
FROM fact_sales f
JOIN dim_product dp ON f.product_id = dp.product_id
GROUP BY dp.product_name
ORDER BY total_sales DESC
LIMIT 10;
#Sales_by_region
SELECT
    dr.Region,
    SUM(f.Sales) AS regional_sales
FROM fact_sales f
JOIN dim_region dr ON f.region_id = dr.region_id
GROUP BY dr.Region
ORDER BY regional_sales DESC;
