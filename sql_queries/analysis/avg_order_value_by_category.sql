-- average order value by product category
SELECT 
  p.category_name_en,
  ROUND(SUM(oi.price + oi.freight_value) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM order_items oi
JOIN orders_clean o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category_name_en
ORDER BY avg_order_value DESC;