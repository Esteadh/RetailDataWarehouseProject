/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None.
      This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;

Note:
    The BULK INSERT paths point to 'C:\sql\dwh_project\01_datasets\'.
    Change them to the folder where you saved the datasets.
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '================================================';


        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.categories';
        TRUNCATE TABLE bronze.categories;
        PRINT '>> Inserting Data Into: bronze.categories';
        BULK INSERT bronze.categories
        FROM 'C:\Users\Mbg\Downloads\retail_dataset\categories.csv'
        WITH (
             FIRSTROW = 2,
             FIELDTERMINATOR = ',',
             ROWTERMINATOR = '0x0a',
             CODEPAGE = '65001',
             TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.customers';
        TRUNCATE TABLE bronze.customers;

        PRINT '>> Inserting Data Into: bronze.customers';
        BULK INSERT bronze.customers
        FROM 'C:\Users\Mbg\Downloads\retail_dataset\customers.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.employees';
        TRUNCATE TABLE bronze.employees;
        PRINT '>> Inserting Data Into: bronze.employees';
        BULK INSERT bronze.employees
        FROM 'C:\Users\Mbg\Downloads\retail_dataset\employees.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';


        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.order_items';
        TRUNCATE TABLE bronze.order_items;
        PRINT '>> Inserting Data Into: bronze.order_items';
        BULK INSERT bronze.order_items
        FROM 'C:\Users\Mbg\Downloads\retail_dataset\order_items.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.orders';
        TRUNCATE TABLE bronze.orders;
        PRINT '>> Inserting Data Into: bronze.orders';
        BULK INSERT bronze.orders
        FROM 'C:\Users\Mbg\Downloads\retail_dataset\orders.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.payments';
        TRUNCATE TABLE bronze.payments;
        PRINT '>> Inserting Data Into: bronze.payments';
        BULK INSERT bronze.payments
        FROM 'C:\Users\Mbg\Downloads\retail_dataset\payments.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';



        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.products';
        TRUNCATE TABLE bronze.products;
        PRINT '>> Inserting Data Into: bronze.products';
        BULK INSERT bronze.products
        FROM 'C:\Users\Mbg\Downloads\retail_dataset\products.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';
        

        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.promotions';
        TRUNCATE TABLE bronze.promotions;
        PRINT '>> Inserting Data Into: bronze.promotions';
        BULK INSERT bronze.promotions
        FROM 'C:\Users\Mbg\Downloads\retail_dataset\promotions.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';


        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.returns';
        TRUNCATE TABLE bronze.returns;
        PRINT '>> Inserting Data Into: bronze.returns';
        BULK INSERT bronze.returns
        FROM 'C:\Users\Mbg\Downloads\retail_dataset\returns.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

       
       SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.shipments';
        TRUNCATE TABLE bronze.shipments;
        PRINT '>> Inserting Data Into: bronze.shipments';
        BULK INSERT bronze.shipments
        FROM 'C:\Users\Mbg\Downloads\retail_dataset\shipments.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';


        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.stores';
        TRUNCATE TABLE bronze.stores;
        PRINT '>> Inserting Data Into: bronze.stores';
        BULK INSERT bronze.stores
        FROM 'C:\Users\Mbg\Downloads\retail_dataset\stores.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';


        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.supplier';
        TRUNCATE TABLE bronze.supplier;
        PRINT '>> Inserting Data Into: bronze.supplier';
        BULK INSERT bronze.supplier
        FROM 'C:\Users\Mbg\Downloads\retail_dataset\suppliers.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            CODEPAGE = '65001',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';


        SET @batch_end_time = GETDATE();
        PRINT '=========================================='
        PRINT 'Loading Bronze Layer is Completed';
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
