-- total orders by seller
SELECT 
  seller_id,
  COUNT(DISTINCT order_id) AS total_orders
FROM order_items
GROUP BY seller_id
ORDER BY total_orders DESC;