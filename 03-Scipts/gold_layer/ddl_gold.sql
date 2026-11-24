/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse.
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension:  gold.dim_customers
-- =============================================================================
IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
    DROP VIEW gold.dim_customers;
GO

CREATE VIEW gold.dim_customers AS
SELECT
   ROW_NUMBER() OVER(ORDER BY signup_date) AS customer_key,
   customer_id,
   city,
   signup_date
FROM silver.customers;

GO

-- =============================================================================
-- Create Dimension: gold.dim_employees
-- =============================================================================
IF OBJECT_ID('gold.dim_employees', 'V') IS NOT NULL
    DROP VIEW gold.dim_employees;
GO

CREATE VIEW gold.dim_employees AS
SELECT
    ROW_NUMBER() OVER(ORDER BY city) AS employee_key,
    e.employee_id,
    e.store_id,
    e.salary,
    s.city 
FROM silver.employees e
LEFT JOIN silver.stores s
ON e.store_id = s.store_id;


GO


-- =============================================================================
-- Create Dimension: gold.dim_products
-- =============================================================================
IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
    DROP VIEW gold.dim_products;
GO

CREATE VIEW gold.dim_products AS
SELECT
    ROW_NUMBER() OVER(ORDER BY country) AS product_key,
    p.product_id,
    p.category_id,
    c.category_name,
    p.supplier_id,
    s.country,
    p.price
FROM silver.products p
LEFT JOIN silver.categories c
ON p.category_id = c.category_id
LEFT JOIN silver.supplier s
ON s.supplier_id = p.supplier_id;


GO


-- =============================================================================
-- Create Dimension: gold.dim_stores
-- =============================================================================
IF OBJECT_ID('gold.dim_stores', 'V') IS NOT NULL
    DROP VIEW gold.dim_stores;
GO

CREATE VIEW gold.dim_stores AS
SELECT
    ROW_NUMBER() OVER(ORDER BY city) store_key,
    store_id,
    city
FROM silver.stores;



GO


-- =============================================================================
-- Create Dimension: gold.dim_promotions
-- =============================================================================
IF OBJECT_ID('gold.dim_promotions', 'V') IS NOT NULL
    DROP VIEW gold.dim_promotions;
GO

CREATE VIEW gold.dim_promotions AS
SELECT
    ROW_NUMBER() OVER(ORDER BY discount) AS promotion_key,
    promotion_id,
    discount
FROM silver.promotions;



GO


-- =============================================================================
-- Create Dimension:  gold.fact_orders
-- =============================================================================
IF OBJECT_ID('gold.fact_orders', 'V') IS NOT NULL
    DROP VIEW  gold.fact_orders;
GO

CREATE VIEW gold.fact_orders AS
SELECT
    o.order_id,
    cu.customer_key,
    st.store_key,
    pr.promotion_key,
    o.order_date
FROM silver.orders o
LEFT JOIN gold.dim_customers cu
ON o.customer_id = cu.customer_id
LEFT JOIN gold.dim_stores st
ON o.store_id = st.store_id
LEFT JOIN gold.dim_promotions pr
ON o.promotion_id = pr.promotion_id;


GO


-- =============================================================================
-- Create Dimension:  gold.fact_sales
-- =============================================================================
IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
    DROP VIEW  gold.fact_sales;
GO

CREATE VIEW gold.fact_sales AS
SELECT
    oi.order_item_id,
    o.customer_key,
    pd.product_key,
    o.store_key,
    o.promotion_key,
    oi.order_id,
    o.order_date,
    oi.price,
    oi.qty AS quantity,
    oi.qty * oi.price AS sales
FROM silver.order_items oi
LEFT JOIN gold.fact_orders o
ON oi.order_id = o.order_id
LEFT JOIN gold.dim_products pd
ON pd.product_id = oi.product_id;


GO

-- =============================================================================
-- Create Dimension:  gold.fact_shipments
-- =============================================================================
IF OBJECT_ID('gold.fact_shipments', 'V') IS NOT NULL
    DROP VIEW  gold.fact_shipments;
GO

CREATE VIEW gold.fact_shipments AS
SELECT
    s.shipment_id,
    o.customer_key,
    o.store_key,
    s.order_id,
    o.order_date,
    s.status
FROM silver.shipments s
LEFT JOIN gold.fact_orders o
ON o.order_id = s.order_id;


GO


-- =============================================================================
-- Create Dimension: gold.fact_payments
-- =============================================================================
IF OBJECT_ID('gold.fact_payments', 'V') IS NOT NULL
    DROP VIEW  gold.fact_payments;
GO

CREATE VIEW gold.fact_payments AS
 SELECT
    p.payment_id,
    o.customer_key,
    o.store_key,
    p.order_id,
    o.order_date,
    p.amount
FROM silver.payments p
LEFT JOIN gold.fact_orders o
ON o.order_id = p.order_id;



GO



-- =============================================================================
-- Create Dimension: gold.fact_returns
-- =============================================================================
IF OBJECT_ID('gold.fact_returns', 'V') IS NOT NULL
    DROP VIEW  gold.fact_returns;
GO

CREATE VIEW gold.fact_returns AS
SELECT
    r.return_id,
    r.order_item_id,
    s.customer_key,
    s.product_key,
    s.store_key,
    s.order_id,
    s.order_date,
    r.refund
FROM silver.returns r
LEFT JOIN gold.fact_sales s
ON r.order_item_id = s.order_item_id


