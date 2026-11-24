/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to
    populate the 'silver' schema tables from the 'bronze' schema.
    Actions Performed:
        - Truncates Silver tables.
        - Inserts transformed and cleansed data from Bronze into Silver tables.

Parameters:
    None.
      This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC Silver.load_silver;
===============================================================================
*/


CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '================================================';
        PRINT 'Loading Silver Layer';
        PRINT '================================================';


        -- Loading silver.categories
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: silver.categories';
        TRUNCATE TABLE silver.categories;
        PRINT '>> Inserting Data Into: silver.categories';
        INSERT INTO silver.categories(category_id,category_name)
        SELECT
	        category_id,
	        REPLACE(REPLACE(category_name,'Cat','Category'),'_',' ') AS  category_name
        FROM bronze.categories
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        -- Loading silver.customers
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: silver.customers';
        TRUNCATE TABLE silver.customers;
        PRINT '>> Inserting Data Into: silver.customers';
       INSERT INTO silver.customers (customer_id,city,signup_date)
       SELECT
	        customer_id,
	        city,
	        signup_date
        FROM bronze.customers
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        -- Loading silver.employees
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: silver.employees';
        TRUNCATE TABLE silver.employees;
        PRINT '>> Inserting Data Into: silver.employees';
        INSERT INTO silver.employees (employee_id,store_id,salary)
        SELECT
	        employee_id,
	        store_id,
	        salary
        FROM bronze.employees
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';


        -- Loading silver.order_items
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: silver.order_items';
        TRUNCATE TABLE silver.order_items;
        PRINT '>> Inserting Data Into: silver.order_items';
        INSERT INTO silver.order_items (order_item_id,order_id,product_id,qty,price)
        SELECT
	        order_item_id,
	        order_id,
	        product_id,
	        qty,
	        price
        FROM bronze.order_items	
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        -- Loading silver.orders
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: silver.orders';
        TRUNCATE TABLE silver.orders;
        PRINT '>> Inserting Data Into: silver.orders';
        INSERT INTO silver.orders(order_id,customer_id,store_id,order_date,promotion_id)
        SELECT
	        order_id,
	        customer_id,
	        store_id,
	        order_date,
	        promotion_id
        FROM bronze.orders
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        -- Loading silver.payments
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: silver.payments';
        TRUNCATE TABLE silver.payments;
        PRINT '>> Inserting Data Into: silver.payments';
        INSERT INTO silver.payments(payment_id,order_id,amount)
        SELECT
	        payment_id,
	        order_id,
	        amount
        FROM bronze.payments

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';


         -- Loading silver.products
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: silver.products';
        TRUNCATE TABLE silver.products;
        PRINT '>> Inserting Data Into: silver.products';
        INSERT INTO silver.products(product_id,category_id,supplier_id,price)
        SELECT
	        product_id,
	        category_id,
	        supplier_id,
	        price
        FROM bronze.products

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

         -- Loading silver.promotions
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: silver.promotions';
        TRUNCATE TABLE silver.promotions;
        PRINT '>> Inserting Data Into: silver.promotions';
        INSERT INTO silver.promotions(promotion_id,discount)
        SELECT
	        promotion_id,
	        discount
        FROM bronze.promotions

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

         -- Loading silver.returns
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: silver.returns';
        TRUNCATE TABLE silver.returns;
        PRINT '>> Inserting Data Into: silver.returns';
       INSERT INTO silver.returns(return_id,order_item_id,refund)
       SELECT
	        return_id,
	        order_item_id,
	        refund
       FROM bronze.returns

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

          -- Loading silver.shipments
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: silver.shipments';
        TRUNCATE TABLE silver.shipments;
        PRINT '>> Inserting Data Into: silver.shipments';
       INSERT INTO silver.shipments(shipment_id,order_id,status)
       SELECT
	        shipment_id,
	        order_id,
	        status
       FROM bronze.shipments

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

          -- Loading silver.stores
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: silver.stores';
        TRUNCATE TABLE silver.stores;
        PRINT '>> Inserting Data Into: silver.stores';
       INSERT INTO silver.stores(store_id,city)
       SELECT
	        store_id,
	        city
       FROM bronze.stores

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

         -- Loading silver.supplier
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: silver.supplier';
        TRUNCATE TABLE silver.supplier;
        PRINT '>> Inserting Data Into: silver.supplier';
       
        INSERT INTO silver.supplier(supplier_id,country)
        SELECT
	        supplier_id,
	        CASE WHEN UPPER(TRIM(country)) = 'USA' THEN 'United States'
	        ELSE country
	        END AS country
        FROM bronze.supplier

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';


        SET @batch_end_time = GETDATE();
        PRINT '=========================================='
        PRINT 'Loading Silver Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '=========================================='

    END TRY
    BEGIN CATCH
        PRINT '=========================================='
        PRINT 'ERROR OCCURRED DURING LOADING SILVER LAYER'
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST (ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error State: ' + CAST (ERROR_STATE() AS NVARCHAR);
        PRINT '=========================================='
    END CATCH
END


