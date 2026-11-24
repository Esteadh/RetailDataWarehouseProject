--Data quality check for order_items table

SELECT
	order_item_id,
	order_id,
	product_id,
	qty,
	price
FROM bronze.order_items	


--Checking unique key order_item_id for duplicates and 

SELECT
	order_item_id,
	COUNT(*)
FROM bronze.order_items
GROUP BY order_item_id
HAVING COUNT(*) > 1 OR order_item_id IS NULL


--Checking foreign key order_id for matching table orders.
--Expectation zero
SELECT
	order_item_id,
	order_id,
	product_id,
	qty,
	price
FROM bronze.order_items	
WHERE order_id NOT IN (SELECT order_id FROM bronze.orders)

SELECT order_id FROM bronze.orders

--Checking foreign key product_id for matching table products.
--Expectation zero
SELECT
	order_item_id,
	order_id,
	product_id,
	qty,
	price
FROM bronze.order_items	
WHERE product_id NOT IN (SELECT product_id FROM bronze.products)


--Checking qty for null and 0 and negative

SELECT
	qty
FROM bronze.order_items
WHERE qty < 0 OR qty IS NULL OR qty = 0


--Checking price for null and negative

SELECT
	price
FROM bronze.order_items
WHERE price < 0 OR price IS NULL 

--Checking new table silver.order_items
SELECT * FROM silver.order_items
