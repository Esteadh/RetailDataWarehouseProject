--Checking data quality for promotions

SELECT
	promotion_id,
	discount
FROM bronze.promotions

--Looking unique key promotion_id for duplicates and nulls

SELECT
	promotion_id,
	COUNT(*)
FROM bronze.promotions
GROUP BY promotion_id
HAVING COUNT(*) > 1 OR promotion_id IS NULL

--Looking discount for negative values and nulls

SELECT
	discount
FROM bronze.promotions
WHERE discount < 0 OR discount IS NULL


--Checking new table silver.promotions

SELECT
	*
FROM silver.promotions
