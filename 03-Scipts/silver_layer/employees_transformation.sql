--Transformation querry for silver.employees


INSERT INTO silver.employees (employee_id,store_id,salary)
SELECT
	employee_id,
	store_id,
	salary
FROM bronze.employees
