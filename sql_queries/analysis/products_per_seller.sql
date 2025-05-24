-- number of products per seller
SELECT 
  seller_id,
  COUNT(DISTINCT product_id) AS total_products
FROM order_items
GROUP BY seller_id
ORDER BY total_products DESC;
