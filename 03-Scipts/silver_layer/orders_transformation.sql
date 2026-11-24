--Querry for new table silver.orders


INSERT INTO silver.orders(order_id,customer_id,store_id,order_date,promotion_id)
SELECT
	order_id,
	customer_id,
	store_id,
	order_date,
	promotion_id
FROM bronze.orders
