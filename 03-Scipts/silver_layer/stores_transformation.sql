--Querry for new table silver.stores

INSERT INTO silver.stores(store_id,city)
SELECT
	store_id,
	city
FROM bronze.stores
