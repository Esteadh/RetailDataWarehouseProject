--Querry for new table silver.products

INSERT INTO silver.products(product_id,category_id,supplier_id,price)
SELECT
	product_id,
	category_id,
	supplier_id,
	price
FROM bronze.products

