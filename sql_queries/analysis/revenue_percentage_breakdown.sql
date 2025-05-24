-- freight vs price as percentage of total revenue
SELECT 
  ROUND(SUM(oi.price) / SUM(oi.price + oi.freight_value) * 100, 2) AS price_percentage,
  ROUND(SUM(oi.freight_value) / SUM(oi.price + oi.freight_value) * 100, 2) AS freight_percentage
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL;
