-- total revenue 
SELECT 
  ROUND(SUM(price + freight_value), 2) AS total_revenue
FROM order_items oi
JOIN orders_clean o ON oi.order_id = o.order_id;