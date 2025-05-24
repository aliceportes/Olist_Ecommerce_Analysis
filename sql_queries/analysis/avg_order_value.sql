-- average order value (AOV)
SELECT 
  ROUND(SUM(oi.price + oi.freight_value) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM order_items oi
JOIN orders_clean o ON oi.order_id = o.order_id;
