/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables
    if they already exist.
      Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/



IF OBJECT_ID('silver.categories', 'U') IS NOT NULL
    DROP TABLE silver.categories;
GO

CREATE TABLE silver.categories 
(
    category_id INT,
    category_name VARCHAR(50),
    dwh_create_date DATETIME2 DEFAULT GETDATE()

);

GO

IF OBJECT_ID('silver.customers', 'U') IS NOT NULL
    DROP TABLE silver.customers;
GO

CREATE TABLE silver.customers
(
    customer_id INT,
    city VARCHAR(50),
    signup_date DATE,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);


GO

IF OBJECT_ID('silver.employees', 'U') IS NOT NULL
    DROP TABLE silver.employees;
GO


CREATE TABLE silver.employees
(
    employee_id INT,
    store_id INT,
    salary BIGINT,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);


GO

IF OBJECT_ID('silver.order_items', 'U') IS NOT NULL
    DROP TABLE silver.order_items;
GO


CREATE TABLE silver.order_items
(
order_item_id INT,
order_id INT,
product_id INT,
qty BIGINT,
price BIGINT,
dwh_create_date DATETIME2 DEFAULT GETDATE()
);


GO

IF OBJECT_ID('silver.orders', 'U') IS NOT NULL
    DROP TABLE silver.orders;
GO



CREATE TABLE silver.orders
(
order_id INT,
customer_id INT,
store_id INT,
order_date DATE,
promotion_id INT,
dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO

IF OBJECT_ID('silver.payments', 'U') IS NOT NULL
    DROP TABLE silver.payments;
GO


CREATE TABLE silver.payments
(
payment_id INT,
order_id INT,
amount BIGINT,
dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO

IF OBJECT_ID('silver.products', 'U') IS NOT NULL
    DROP TABLE silver.products;
GO

CREATE TABLE silver.products
(
product_id INT,
category_id INT,
supplier_id INT,
price BIGINT,
dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO

IF OBJECT_ID('silver.promotions', 'U') IS NOT NULL
    DROP TABLE silver.promotions;
GO

CREATE TABLE silver.promotions
(
    promotion_id INT,
    discount BIGINT,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);


GO


IF OBJECT_ID('silver.returns', 'U') IS NOT NULL
    DROP TABLE silver.returns;
GO

CREATE TABLE silver.returns
(
    return_id INT,
    order_item_id INT,
    refund BIGINT,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);


GO

IF OBJECT_ID('silver.shipments', 'U') IS NOT NULL
    DROP TABLE silver.shipments;
GO

CREATE TABLE silver.shipments
(
    shipment_id INT,
    order_id INT,
    status VARCHAR(50),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);


GO

IF OBJECT_ID('silver.stores', 'U') IS NOT NULL
    DROP TABLE silver.stores;
GO

CREATE TABLE silver.stores
(
store_id INT,
city VARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
);


GO

IF OBJECT_ID('silver.supplier', 'U') IS NOT NULL
    DROP TABLE silver.supplier;
GO

CREATE TABLE silver.supplier
(
supplier_id INT,
country VARCHAR(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()
);

