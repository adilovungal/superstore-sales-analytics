# Data Model — Superstore Sales Analytics

## Overview

The Superstore analytics solution uses a **star schema** to support fast, scalable analytical queries. The model separates transactional measures into a central fact table and descriptive attributes into dimension tables.

This design improves:

* Query performance
* Aggregation speed
* Data maintainability
* BI tool compatibility

---

## Schema Type

**Star Schema**

```
                dim_customer
                      |
dim_date —— fact_sales —— dim_product
                      |
                  dim_region
```

---

## Fact Table

### fact_sales

The fact table stores transactional sales metrics at the **order line level**.

**Grain:** One row per order line item.

#### Keys

* customer_id (FK)
* product_id (FK)
* region_id (FK)
* date_id (FK)

#### Measures

* Sales
* Profit
* Quantity
* Discount

#### Operational Fields

* order_id
* ship_date
* ship_mode

---

## Dimension Tables

### dim_customer

Stores customer-related descriptive attributes.

**Primary Key:** customer_id

**Attributes:**

* customer_key (source Customer ID)
* customer_name
* segment
* country

**Purpose:** Enables customer segmentation and behavioral analysis.

---

### dim_product

Stores product hierarchy information.

**Primary Key:** product_id

**Attributes:**

* product_key (source Product ID)
* category
* sub_category
* product_name

**Purpose:** Supports product and category performance analysis.

---

### dim_region

Stores geographical hierarchy.

**Primary Key:** region_id

**Attributes:**

* region
* state
* city

**Purpose:** Enables geographic profitability and sales analysis.

---

### dim_date

Standard calendar dimension used for time intelligence.

**Primary Key:** date_id

**Attributes:**

* order_date
* year
* quarter
* month
* day

**Purpose:** Supports time-based trend analysis and Power BI time intelligence.

---

## Modeling Decisions

### Why Star Schema?

The star schema was chosen because:

* Optimized for analytical workloads
* Simplifies BI tool relationships
* Improves aggregation performance
* Reduces join complexity for reporting users

### Why Surrogate Keys?

Integer surrogate keys were used in dimension tables to:

* Improve join performance
* Maintain consistency
* Support future Slowly Changing Dimensions (SCD)

### Handling Negative Profit

Negative profit rows were retained because they represent legitimate business scenarios (loss-making orders) and are important for accurate profitability analysis.

---

## Data Quality Considerations

The following validations were performed:

* Duplicate row check
* Null validation on key columns
* Date standardization using `STR_TO_DATE`
* Data type enforcement during staging load

---

## Future Enhancements

* Implement Slowly Changing Dimensions (Type 2)
* Add customer geography enrichment
* Introduce incremental fact loading
* Partition large fact tables for scalability

---

**Author:** Adil O
