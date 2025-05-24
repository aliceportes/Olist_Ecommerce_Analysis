-- total orders by customer state
SELECT 
  c.customer_state,
  COUNT(DISTINCT o.order_id) AS total_orders
FROM order_items oi
JOIN orders_clean o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;