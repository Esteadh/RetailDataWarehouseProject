--Transformation querry for silver.customers

INSERT INTO silver.customers (customer_id,city,signup_date)
SELECT
	customer_id,
	city,
	signup_date
FROM bronze.customers
