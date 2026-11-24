-------------------------------------------INDEXES---------------------------------------------------------------------------------

--Since our data sets are large, we can improve performance by applying simple indexing operations to the unique IDs in our tables.


-- CLUSTERED INDEX FOR gold.dim_customers 

CREATE CLUSTERED INDEX idx_dim_customers_customer_key 
ON gold.dim_customers(customer_key);

GO

-- CLUSTERED INDEX FOR gold.dim_employees

CREATE CLUSTERED INDEX idx_dim_employees_employee_key 
ON gold.dim_employees(employee_key);

GO

-- CLUSTERED INDEX FOR gold.dim_products

CREATE CLUSTERED INDEX idx_dim_products_product_key 
ON gold.dim_products(product_key); 

GO
-- CLUSTERED INDEX FOR gold.dim_promotions

CREATE CLUSTERED INDEX idx_dim_promotions_promotion_key
ON gold.dim_promotions(promotion_key); 

GO

-- CLUSTERED INDEX FOR gold.dim_stores

CREATE CLUSTERED INDEX idx_dim_stores_store_key
ON gold.dim_stores(store_key); 

GO


-- CLUSTERED INDEX FOR gold.fact_orders

CREATE CLUSTERED INDEX idx_fact_orders_order_id
ON gold.fact_orders(order_id); 

GO


-- CLUSTERED INDEX FOR gold.fact_payments


CREATE CLUSTERED INDEX idx_fact_payments_payment_id
ON gold.fact_payments(payment_id); 


GO


-- CLUSTERED INDEX FOR gold.fact_returns

 CREATE CLUSTERED INDEX idx_fact_returns_return_id
ON gold.fact_returns(return_id);


GO


-- CLUSTERED INDEX FOR gold.fact_sales
 
 CREATE CLUSTERED INDEX idx_fact_sales_order_item_id
ON gold.fact_sales(order_item_id);


GO

-- CLUSTERED INDEX FOR gold.fact_shipments



 CREATE CLUSTERED INDEX idx_fact_shipments_shipment_id
ON gold.fact_shipments(shipment_id);


