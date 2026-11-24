--Checking data quality for shipments


SELECT
	shipment_id,
	order_id,
	status
FROM bronze.shipments

--Looking unique key shipment_id for duplicates and nulls

SELECT
	shipment_id,
	COUNT(*)
FROM bronze.shipments
GROUP BY shipment_id
HAVING COUNT(*) > 1 OR shipment_id IS NULL


--Looking foreign key order_id for matching.

SELECT
	*
FROM bronze.shipments
WHERE order_id NOT IN(SELECT order_id FROM bronze.orders)


--Looking unwanted spaces for status

SELECT
	status
FROM bronze.shipments
WHERE TRIM(status) != status


--Looking unique status

SELECT
	DISTINCT status
FROM bronze.shipments


--Looking new table silver.shipments

SELECT * FROM silver.shipments
