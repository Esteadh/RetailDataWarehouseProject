--Checking data quality for products

SELECT
	product_id,
	category_id,
	supplier_id,
	price
FROM bronze.products


--Looking unique key product_id for duplicates and nulls

SELECT
	product_id,
	COUNT(*)
FROM bronze.products
GROUP BY product_id
HAVING COUNT(*) > 1 OR product_id IS NULL

--Looking foreign key category_id for matching

SELECT
	*
FROM bronze.products
WHERE category_id NOT IN(SELECT category_id FROM bronze.categories)

--Looking foreign key supplier_id for matching

SELECT
	*
FROM bronze.products
WHERE supplier_id NOT IN(SELECT supplier_id FROM bronze.supplier)

--Looking price for negative values or nulls.

SELECT
	price
FROM bronze.products
WHERE price < 0 OR price IS NULL

--Checking new table silver.products

SELECT * FROM silver.products

