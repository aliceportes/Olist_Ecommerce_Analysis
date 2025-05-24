SELECT * FROM orders LIMIT 10;


-- check for nulls
SELECT 
  COUNT(*) FILTER (WHERE order_status IS NULL) AS null_status,
  COUNT(*) FILTER (WHERE order_approved_at IS NULL) AS null_approved,
  COUNT(*) FILTER (WHERE order_delivered_carrier_date IS NULL) AS null_carrier_date,
  COUNT(*) FILTER (WHERE order_delivered_customer_date IS NULL) AS null_customer_date
FROM orders;

-- check if the number of orders that weren't delivered matchs 
SELECT COUNT(*) AS non_delivered_orders
FROM orders
WHERE order_status <> 'delivered';

-- check distinct values in order_status
SELECT DISTINCT order_status FROM orders ORDER BY order_status;

-- check dulicates
SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;




-- orders that are truly delivered with a delivery timestamp
SELECT *
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;

-- create a view for future analysis
CREATE VIEW orders_clean AS
SELECT *
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;