-- total orders by product category
SELECT 
  p.category_name_en,
  COUNT(DISTINCT o.order_id) AS total_orders
FROM order_items oi
JOIN orders_clean o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category_name_en
ORDER BY total_orders DESC;