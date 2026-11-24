--Checking data quality for orders

SELECT
	order_id,
	customer_id,
	store_id,
	order_date,
	promotion_id
FROM bronze.orders


--Looking unique key order_id for duplicates and null

SELECT
	order_id,
	COUNT(*)
FROM bronze.orders
GROUP BY order_id
HAVING COUNT(*) > 1 OR order_id IS NULL

--Looking foreing key customer_id for matching

SELECT
	*
FROM bronze.orders
WHERE customer_id NOT IN (SELECT customer_id FROM bronze.customers);


SELECT customer_id FROM bronze.customers;

--Looking foreing key store_id for matching

SELECT
	*
FROM bronze.orders
WHERE store_id NOT IN (SELECT store_id FROM bronze.stores);


SELECT store_id FROM bronze.stores


--Looking order_date for boundiries

SELECT
	order_date
FROM bronze.orders
WHERE order_date < '1990-01-01' OR order_date > GETDATE()


--Looking foreing key promotion_id for matching

SELECT
	*
FROM bronze.orders
WHERE promotion_id NOT IN (SELECT promotion_id FROM bronze.promotions);


SELECT promotion_id FROM bronze.promotions

--Checking new table silver.orders
SELECT * FROM silver.orders
