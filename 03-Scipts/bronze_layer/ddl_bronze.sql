/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables
    if they already exist.
      Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID('bronze.categories', 'U') IS NOT NULL
    DROP TABLE bronze.categories;
GO

CREATE TABLE bronze.categories 
(
    category_id INT,
    category_name VARCHAR(50)

);

GO

IF OBJECT_ID('bronze.customers', 'U') IS NOT NULL
    DROP TABLE bronze.customers;
GO

CREATE TABLE bronze.customers
(
    customer_id INT,
    city VARCHAR(50),
    signup_date DATE
);


GO

IF OBJECT_ID('bronze.employees', 'U') IS NOT NULL
    DROP TABLE bronze.employees;
GO


CREATE TABLE bronze.employees
(
    employee_id INT,
    store_id INT,
    salary INT
);


GO

IF OBJECT_ID('bronze.order_items', 'U') IS NOT NULL
    DROP TABLE bronze.order_items;
GO


CREATE TABLE bronze.order_items
(
order_item_id INT,
order_id INT,
product_id INT,
qty INT,
price INT
);


GO

IF OBJECT_ID('bronze.orders', 'U') IS NOT NULL
    DROP TABLE bronze.orders;
GO



CREATE TABLE bronze.orders
(
order_id INT,
customer_id INT,
store_id INT,
order_date DATE,
promotion_id INT
);

GO

IF OBJECT_ID('bronze.payments', 'U') IS NOT NULL
    DROP TABLE bronze.payments;
GO


CREATE TABLE bronze.payments
(
payment_id INT,
order_id INT,
amount INT
);

GO

IF OBJECT_ID('bronze.products', 'U') IS NOT NULL
    DROP TABLE bronze.products;
GO

CREATE TABLE bronze.products
(
product_id INT,
category_id INT,
supplier_id INT,
price INT
);

GO

IF OBJECT_ID('bronze.promotions', 'U') IS NOT NULL
    DROP TABLE bronze.promotions;
GO

CREATE TABLE bronze.promotions
(
    promotion_id INT,
    discount INT
);


GO


IF OBJECT_ID('bronze.returns', 'U') IS NOT NULL
    DROP TABLE bronze.returns;
GO

CREATE TABLE bronze.returns
(
    return_id INT,
    order_item_id INT,
    refund INT
);


GO

IF OBJECT_ID('bronze.shipments', 'U') IS NOT NULL
    DROP TABLE bronze.shipments;
GO

CREATE TABLE bronze.shipments
(
    shipment_id INT,
    order_id INT,
    status VARCHAR(50)
);


GO

IF OBJECT_ID('bronze.stores', 'U') IS NOT NULL
    DROP TABLE bronze.stores;
GO

CREATE TABLE bronze.stores
(
store_id INT,
city VARCHAR(50)
);


GO

IF OBJECT_ID('bronze.supplier', 'U') IS NOT NULL
    DROP TABLE bronze.supplier;
GO

CREATE TABLE bronze.supplier
(
supplier_id INT,
country VARCHAR(50)
);

