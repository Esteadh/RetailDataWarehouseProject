--Data Quality Check for categories table

--Checking unique id for duplicates and null data.
SELECT
	category_id,
	COUNT(*) 
FROM bronze.categories
GROUP BY category_id
HAVING COUNT(*) > 1 OR category_id IS NULL

--Checking unwanted spaces

SELECT
	category_name
FROM bronze.categories
WHERE category_name != TRIM(category_name)

--Data standartization for category name

SELECT
	category_name,
	REPLACE(REPLACE(category_name,'Cat','Category'),'_',' ')
FROM bronze.categories


--Looking for new table silver.categories

SELECT
	*
FROM silver.categories
