
INSERT INTO silver.categories(category_id,category_name)
SELECT
	category_id,
	REPLACE(REPLACE(category_name,'Cat','Category'),'_',' ') AS  category_name
FROM bronze.categories
