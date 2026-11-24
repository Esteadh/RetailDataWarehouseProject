--Checking data quality for stores.

SELECT
	store_id,
	city
FROM bronze.stores


--Looking unique key store_id for duplicates and nulls

SELECT
	store_id,
	COUNT(*)
FROM bronze.stores
GROUP BY store_id
HAVING COUNT(*) > 1 OR store_id IS NULL


--Looking city for unwanted spaces

SELECT
	city
FROM bronze.stores
WHERE TRIM(city) != city


--Looking unique city 

SELECT
	DISTINCT city
FROM bronze.stores


--Checking new table silver.stores

SELECT * FROM silver.stores
