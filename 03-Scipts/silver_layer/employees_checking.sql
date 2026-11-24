--Data quality checking for employees

SELECT
	employee_id,
	store_id,
	salary
FROM bronze.employees


--Checking uniqe key employee_id for dublicates and nulls

SELECT
	employee_id,
	COUNT(*)
FROM bronze.employees
GROUP BY employee_id
HAVING COUNT(*) > 1 OR employee_id IS NULL


--We check whether the foreign key “store_id” matches for store table
--Expectation Zero value

SELECT
	employee_id,
	store_id,
	salary
FROM bronze.employees
WHERE store_id NOT IN (SELECT store_id FROM bronze.stores)


--Checking salary for negative salary or null values.

SELECT
	salary
FROM bronze.employees
WHERE salary < 0 OR salary IS NULL;

--Checking new tables silver.employees

SELECT
	*
FROM silver.employees
