--Transformation querry for silver.order_items

INSERT INTO silver.order_items (order_item_id,order_id,product_id,qty,price)
SELECT
	order_item_id,
	order_id,
	product_id,
	qty,
	price
FROM bronze.order_items	
