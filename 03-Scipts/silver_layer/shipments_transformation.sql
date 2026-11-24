--Querry for new table silver.shipments.


INSERT INTO silver.shipments(shipment_id,order_id,status)
SELECT
	shipment_id,
	order_id,
	status
FROM bronze.shipments
