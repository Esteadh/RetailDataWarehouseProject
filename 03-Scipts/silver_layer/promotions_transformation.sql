--Querry for new table silver.promotions


INSERT INTO silver.promotions(promotion_id,discount)
SELECT
	promotion_id,
	discount
FROM bronze.promotions
