 /* We created this database to load the views from the “gold layer” of the data warehouse we had previously built into physical tables in the new database 
 we are about to create. We did this because, given the large size of our dataset, the importance of the indexes and partitions we will create has increased. 
 Therefore, we created this database both for analysis and to improve performance, and we loaded the views into our tables.
*/

 CREATE DATABASE RetailAnalysticsDB;

 GO


 USE RetailAnalysticsDB;

 GO

 CREATE SCHEMA gold;

 GO


 -- =============================================================================
-- Insert Dimension:  gold.dim_customers
-- =============================================================================
IF OBJECT_ID('gold.dim_customers', 'U') IS NOT NULL
    DROP TABLE gold.dim_customers;
GO

SELECT
	*
	INTO gold.dim_customers
FROM RetailDataWarehouse.gold.dim_customers;

GO
 
 -- =============================================================================
-- Insert Dimension: gold.dim_employees
-- =============================================================================
IF OBJECT_ID('gold.dim_employees', 'U') IS NOT NULL
    DROP TABLE gold.dim_employees;
GO

SELECT
	*
	INTO gold.dim_employees
FROM RetailDataWarehouse.gold.dim_employees;


GO


-- =============================================================================
-- INSERT Dimension: gold.dim_products
-- =============================================================================
IF OBJECT_ID('gold.dim_products', 'U') IS NOT NULL
    DROP TABLE gold.dim_products;
GO

SELECT
	*
	INTO gold.dim_products
FROM RetailDataWarehouse.gold.dim_products;


GO


-- =============================================================================
-- INSERT Dimension: gold.dim_stores
-- =============================================================================
IF OBJECT_ID('gold.dim_stores', 'U') IS NOT NULL
    DROP TABLE gold.dim_stores;
GO

SELECT
	*
	INTO gold.dim_stores
FROM RetailDataWarehouse.gold.dim_stores;


GO


-- =============================================================================
-- INSERT Dimension: gold.dim_promotions
-- =============================================================================
IF OBJECT_ID('gold.dim_promotions', 'U') IS NOT NULL
    DROP TABLE gold.dim_promotions;
GO

SELECT
	*
	INTO gold.dim_promotions
FROM RetailDataWarehouse.gold.dim_promotions;


GO


-- =============================================================================
-- INSERT Dimension:  gold.fact_orders
-- =============================================================================
IF OBJECT_ID('gold.fact_orders', 'U') IS NOT NULL
    DROP TABLE gold.fact_orders;
GO

SELECT
	*
	INTO gold.fact_orders
FROM RetailDataWarehouse.gold.fact_orders;


GO


-- =============================================================================
-- INSERT Dimension:  gold.fact_sales
-- =============================================================================
IF OBJECT_ID('gold.fact_sales', 'U') IS NOT NULL
    DROP TABLE gold.fact_sales;
GO


SELECT
	*
	INTO gold.fact_sales
FROM RetailDataWarehouse.gold.fact_sales;


GO


-- =============================================================================
-- INSERT Dimension:  gold.fact_shipments
-- =============================================================================
IF OBJECT_ID('gold.fact_shipments', 'U') IS NOT NULL
    DROP TABLE gold.fact_shipments;
GO

SELECT
	*
	INTO gold.fact_shipments
FROM RetailDataWarehouse.gold.fact_shipments;


GO


-- =============================================================================
-- INSERT Dimension: gold.fact_payments
-- =============================================================================
IF OBJECT_ID('gold.fact_payments', 'U') IS NOT NULL
    DROP TABLE gold.fact_payments;
GO

SELECT
	*
	INTO gold.fact_payments
FROM RetailDataWarehouse.gold.fact_payments;


GO



-- =============================================================================
-- INSERT Dimension: gold.fact_returns
-- =============================================================================
IF OBJECT_ID('gold.fact_returns', 'U') IS NOT NULL
    DROP TABLE gold.fact_returns;
GO

SELECT
	*
	INTO gold.fact_returns
FROM RetailDataWarehouse.gold.fact_returns;



