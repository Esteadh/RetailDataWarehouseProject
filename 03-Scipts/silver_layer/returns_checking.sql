--Checking data quality for returns


SELECT
	return_id,
	order_item_id,
	refund
FROM bronze.returns

--Looking unique key return_id for duplicates and nulls.

SELECT
	return_id,
	COUNT(*)
FROM bronze.returns
GROUP BY return_id
HAVING COUNT(*) > 1 OR return_id IS NULL


--Looking foreign key order_item_id for matching.

SELECT
	*
FROM bronze.returns
WHERE order_item_id NOT IN(SELECT order_item_id FROM bronze.order_items)


--Looking refund for negative values or nulls

SELECT
	refund
FROM bronze.returns
WHERE refund < 0 OR refund IS NULL


--Checking new table silver.returns

SELECT * FROM silver.returns
