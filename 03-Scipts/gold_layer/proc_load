CREATE OR ALTER PROCEDURE gold.load_gold AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '================================================';
        PRINT 'Loading Dimension Tables';
        PRINT '================================================';


        SET @start_time = GETDATE();
        PRINT '>> Droping Table: gold.dim_customers';
        IF OBJECT_ID('gold.dim_customers', 'U') IS NOT NULL
        DROP TABLE gold.dim_customers;
        PRINT '>> Inserting Data Into: gold.dim_customers';
        SELECT
	            *
	    INTO gold.dim_customers
        FROM RetailDataWarehouse.gold.dim_customers;

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        SET @start_time = GETDATE();
        PRINT '>> Droping Table: gold.dim_employees';
        IF OBJECT_ID('gold.dim_employees', 'U') IS NOT NULL
        DROP TABLE gold.dim_employees;
        PRINT '>> Inserting Data Into: gold.dim_employees';
        SELECT
	            *
	    INTO gold.dim_employees
        FROM RetailDataWarehouse.gold.dim_employees;
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        SET @start_time = GETDATE();
        PRINT '>> Droping Table: gold.dim_products';
        IF OBJECT_ID('gold.dim_products', 'U') IS NOT NULL
        DROP TABLE gold.dim_products;
        PRINT '>> Inserting Data Into: gold.dim_products';
        SELECT
	            *
	    INTO gold.dim_products
        FROM RetailDataWarehouse.gold.dim_products;
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';


        SET @start_time = GETDATE();
        PRINT '>> Droping Table: gold.dim_stores';
        IF OBJECT_ID('gold.dim_stores', 'U') IS NOT NULL
        DROP TABLE gold.dim_stores;
        PRINT '>> Inserting Data Into: gold.dim_stores';
        SELECT
	         *
	    INTO gold.dim_stores
        FROM RetailDataWarehouse.gold.dim_stores;
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        SET @start_time = GETDATE();
        PRINT '>> Droping Table: gold.dim_promotions';
        IF OBJECT_ID('gold.dim_promotions', 'U') IS NOT NULL
        DROP TABLE gold.dim_promotions;
        PRINT '>> Inserting Data Into: gold.dim_promotions';
        SELECT
	        *
	    INTO gold.dim_promotions
        FROM RetailDataWarehouse.gold.dim_promotions;
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';


        PRINT '================================================';
        PRINT 'Loading Fact Tables';
        PRINT '================================================';


        SET @start_time = GETDATE();
        PRINT '>> Droping Table: gold.fact_orders';
        IF OBJECT_ID('gold.fact_orders', 'U') IS NOT NULL
        DROP TABLE gold.fact_orders;
        PRINT '>> Inserting Data Into: gold.fact_orders';
        SELECT
	        *
	    INTO gold.fact_orders
        FROM RetailDataWarehouse.gold.fact_orders;

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';



        SET @start_time = GETDATE();
        PRINT '>> Droping Table: gold.fact_sales';
        IF OBJECT_ID('gold.fact_sales', 'U') IS NOT NULL
        DROP TABLE gold.fact_sales;
        PRINT '>> Inserting Data Into: gold.fact_sales';
        SELECT
	        *
	    INTO gold.fact_sales
        FROM RetailDataWarehouse.gold.fact_sales;

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';
        

        SET @start_time = GETDATE();

        PRINT '>> Droping Table: gold.fact_shipments';
        IF OBJECT_ID('gold.fact_shipments', 'U') IS NOT NULL
        DROP TABLE gold.fact_shipments;
        PRINT '>> Inserting Data Into: gold.fact_shipments';
        SELECT
	        *
	    INTO gold.fact_shipments
        FROM RetailDataWarehouse.gold.fact_shipments;


        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';


        SET @start_time = GETDATE();

        PRINT '>> Droping Table: gold.fact_payments';
        IF OBJECT_ID('gold.fact_payments', 'U') IS NOT NULL
        DROP TABLE gold.fact_payments;
        PRINT '>> Inserting Data Into: gold.fact_payments';
        SELECT
	        *
	    INTO gold.fact_payments
        FROM RetailDataWarehouse.gold.fact_payments;

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

       
       SET @start_time = GETDATE();

        PRINT '>> Droping Table: gold.fact_returns';
        IF OBJECT_ID('gold.fact_returns', 'U') IS NOT NULL
        DROP TABLE gold.fact_returns;
        PRINT '>> Inserting Data Into: gold.fact_returns';
        SELECT
	        *
	    INTO gold.fact_returns
        FROM RetailDataWarehouse.gold.fact_returns;

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';


        SET @batch_end_time = GETDATE();
        PRINT '=========================================='
        PRINT 'Loading Gold Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '=========================================='
    END TRY
    BEGIN CATCH
        PRINT '=========================================='
        PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER'
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST (ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error State: ' + CAST (ERROR_STATE() AS NVARCHAR);
        PRINT '=========================================='
    END CATCH
END
