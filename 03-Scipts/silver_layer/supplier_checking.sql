--Checking data quality for supplier

SELECT
	supplier_id,
	country
FROM bronze.supplier


--Looking unique key supplier_id for duplicates and nulls

SELECT
	supplier_id,
	COUNT(*)
FROM bronze.supplier
GROUP BY supplier_id
HAVING COUNT(*) > 1 OR supplier_id IS NULL


--Looking country for unwanted spaces

SELECT
	country
FROM bronze.supplier
WHERE TRIM(country) != country


--Looking unique country

SELECT
	DISTINCT country
FROM bronze.supplier


--Data standartization
SELECT
	DISTINCT country,
	CASE WHEN UPPER(TRIM(country)) = 'USA' THEN 'United States'
		 ELSE country
	END AS country
FROM bronze.supplier


--Looking new table silver.supplier

SELECT * FROM silver.supplier
