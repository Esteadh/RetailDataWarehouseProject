--Querry for new table silver.supplier


INSERT INTO silver.supplier(supplier_id,country)
SELECT
	supplier_id,
	CASE WHEN UPPER(TRIM(country)) = 'USA' THEN 'United States'
	ELSE country
	END AS country
FROM bronze.supplier
