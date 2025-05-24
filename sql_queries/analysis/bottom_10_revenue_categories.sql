-- bottom 10 categories by revenue
SELECT 
  p.category_name_en,
  ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue
FROM order_items oi
JOIN orders_clean o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category_name_en
ORDER BY total_revenue ASC
LIMIT 10;