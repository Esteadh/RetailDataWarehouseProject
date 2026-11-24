/* ==============================================================================
   SQL Partitioning
-------------------------------------------------------------------------------
   This script demonstrates SQL Server partitioning features. It covers the
   creation of partition functions, filegroups, data files, partition schemes,
   partitioned tables, and verification queries. It also shows how to compare
   execution plans between partitioned and non-partitioned tables.

   Table of Contents:
     1. Create a Partition Function
     2. Create Filegroups
     3. Create Data Files
     4. Create Partition Scheme
     5. Create the Partitioned Table
     6. Insert Data Into the Partitioned Table
     7. Verify Partitioning and Compare Execution Plans
=================================================================================
*/



--Looking sales table for min and max order.

SELECT
    MIN(order_date) min_date,
    MAX(order_date) max_date
FROM gold.fact_sales



/* ==============================================================================
   Step 1: Create a Partition Function
============================================================================== */

-- Create Left Range Partition Functions based on Years

CREATE PARTITION FUNCTION PartitionByYear(DATE)
AS RANGE LEFT FOR VALUES('2020-12-31','2021-12-31','2022-12-31','2023-12-31')



-- Query lists all existing Partition Function
SELECT 
	name,
	function_id,
	type,
	type_desc,
	boundary_value_on_right
FROM sys.partition_functions


/* ==============================================================================
   Step 2: Create Filegroups
============================================================================== */

-- Create Filegroups in RetailAnalysticDB


ALTER DATABASE RetailAnalysticsDB ADD FILEGROUP FGR_2020;
ALTER DATABASE RetailAnalysticsDB ADD FILEGROUP FGR_2021;
ALTER DATABASE RetailAnalysticsDB ADD FILEGROUP FGR_2022;
ALTER DATABASE RetailAnalysticsDB ADD FILEGROUP FGR_2023;
ALTER DATABASE RetailAnalysticsDB ADD FILEGROUP FGR_2024;

-- Query: List All Existing Filegroups (filter by name pattern if needed)
SELECT *
FROM sys.filegroups
WHERE type = 'FG'


/* ==============================================================================
   Step 3: Create Data Files
============================================================================== */

-- Create Files and map them to Filegroups

ALTER DATABASE RetailAnalysticsDB ADD FILE
(
    Name = PR_2020, --LogicalName
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\PR_2020.ndf'
) TO FILEGROUP FGR_2020;

ALTER DATABASE RetailAnalysticsDB ADD FILE
(
    Name = PR_2021, --LogicalName
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\PR_2021.ndf'
) TO FILEGROUP FGR_2021;

ALTER DATABASE RetailAnalysticsDB ADD FILE
(
    Name = PR_2022, --LogicalName
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\PR_2022.ndf'
) TO FILEGROUP FGR_2022;

ALTER DATABASE RetailAnalysticsDB ADD FILE
(
    Name = PR_2023, --LogicalName
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\PR_2023.ndf'
) TO FILEGROUP FGR_2023;

ALTER DATABASE RetailAnalysticsDB ADD FILE
(
    Name = PR_2024, --LogicalName
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\PR_2024.ndf'
) TO FILEGROUP FGR_2024;


-- Query: List All Existing Files in RetailAnalysticDB
SELECT 
    fg.name AS FilegroupName,
    mf.name AS LogicalFileName,
    mf.physical_name AS PhysicalFilePath,
    mf.size / 128 AS SizeInMB
FROM 
    sys.filegroups fg
JOIN 
    sys.master_files mf ON fg.data_space_id = mf.data_space_id
WHERE 
    mf.database_id = DB_ID('RetailAnalysticsDB')


/* ==============================================================================
   Step 4: Create Partition Scheme
============================================================================== */

CREATE PARTITION SCHEME SchemePartitionByYear
AS PARTITION PartitionByYear
TO (FGR_2020,FGR_2021,FGR_2022,FGR_2023,FGR_2024)

-- Query lists all Partition Scheme
SELECT 
    ps.name AS PartitionSchemeName,
    pf.name AS PartitionFunctionName,
    ds.destination_id AS PartitionNumber,
    fg.name AS FilegroupName
FROM sys.partition_schemes ps
JOIN sys.partition_functions pf ON ps.function_id = pf.function_id
JOIN sys.destination_data_spaces ds ON ps.data_space_id = ds.partition_scheme_id
JOIN sys.filegroups fg ON ds.data_space_id = fg.data_space_id

/* ==============================================================================
   Step 5: Create the Partitioned Table
============================================================================== */


CREATE TABLE gold.fact_sales_partitioned
(   order_item_id INT,
    customer_key BIGINT,
    product_key BIGINT,
    store_key BIGINT,    
    promotion_key BIGINT,
    order_id BIGINT,
    order_date DATE,
    price BIGINT,
    quantity BIGINT,
    sales BIGINT
) ON SchemePartitionByYear(order_date)


SELECT * FROM gold.fact_sales_partitioned;


/* ==============================================================================
   Step 7: Verify Partitioning and Compare Execution Plans
============================================================================== */

-- Query: Verify that data is correctly partitioned and assigned to the appropriate filegroups 
SELECT 
    p.partition_number AS PartitionNumber,
    f.name AS PartitionFilegroup, 
    p.rows AS NumberOfRows 
FROM sys.partitions p
JOIN sys.destination_data_spaces dds ON p.partition_number = dds.destination_id
JOIN sys.filegroups f ON dds.data_space_id = f.data_space_id
WHERE OBJECT_NAME(p.object_id) = 'fact_sales_partitioned';

--INSERT INTO NEW PARTITION TABLE gold.fact_sales_partitioned

INSERT INTO gold.fact_sales_partitioned(order_item_id,customer_key,product_key,store_key,promotion_key,order_id,order_date,price,quantity,sales)
SELECT
    order_item_id,
    customer_key,
    product_key,
    store_key,
    promotion_key,
    order_id,
    order_date,
    price,
    quantity,
    sales
FROM gold.fact_sales


SELECT * FROM gold.fact_sales_partitioned;


--CREATE INDEX FOR NEW TABLE gold.fact_sales_partitioned

CREATE CLUSTERED INDEX idx_fact_sales_order_item_id
ON gold.fact_sales_partitioned(order_item_id)



