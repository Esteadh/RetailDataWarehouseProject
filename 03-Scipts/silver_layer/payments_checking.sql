--Checking data quality for payments

SELECT
	payment_id,
	order_id,
	amount
FROM bronze.payments


--Looking unique key payment_id for duplicates and nulls

SELECT
	payment_id,
	COUNT(*)
FROM bronze.payments
GROUP BY payment_id
HAVING COUNT(*) > 1 OR payment_id IS NULL


--Looking foreign key order_id for matching

SELECT
	*
FROM bronze.payments
WHERE order_id NOT IN (SELECT order_id FROM bronze.orders)

--Looking amount for negative values and nulls

SELECT
	amount
FROM bronze.payments
WHERE amount < 0 OR amount IS NULL


--Looking new table silver.payments

SELECT * FROM silver.payments
