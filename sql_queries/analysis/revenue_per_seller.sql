-- revenue per seller
SELECT 
  seller_id,
  ROUND(SUM(price + freight_value), 2) AS total_revenue
FROM order_items
GROUP BY seller_id
ORDER BY total_revenue DESC;