--Quality checking for customers table

SELECT
	customer_id,
	city,
	signup_date
FROM bronze.customers

--Looking unique key customer_id for duplicates and nulls

SELECT
	customer_id,
	COUNT(*)
FROM bronze.customers
GROUP BY customer_id
HAVING COUNT(*) > 1 OR customer_id IS NULL


--Looking unwanted spaces for city

SELECT
	city
FROM bronze.customers
WHERE TRIM(city) != city

--Looking unique cities

SELECT
	DISTINCT city
FROM bronze.customers

--Looking boundries for signup_date

SELECT
	signup_date
FROM bronze.customers
WHERE signup_date < '1990-01-01' OR signup_date > GETDATE()

--Checking new table silver.customers

SELECT * FROM silver.customers
