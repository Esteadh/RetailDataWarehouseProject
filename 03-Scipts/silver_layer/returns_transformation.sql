--Querry for new table silver.returns

INSERT INTO silver.returns(return_id,order_item_id,refund)
SELECT
	return_id,
	order_item_id,
	refund
FROM bronze.returns
