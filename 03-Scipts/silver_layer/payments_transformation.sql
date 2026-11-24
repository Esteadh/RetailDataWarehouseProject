--Querry for new table silver.payments

INSERT INTO silver.payments(payment_id,order_id,amount)
SELECT
	payment_id,
	order_id,
	amount
FROM bronze.payments
