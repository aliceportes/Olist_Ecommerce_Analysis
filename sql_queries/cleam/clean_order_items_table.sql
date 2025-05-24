SELECT * FROM order_items LIMIT 10;

--check for nulls
SELECT 
  COUNT(*) FILTER (WHERE order_id IS NULL) AS null_order_id,
  COUNT(*) FILTER (WHERE product_id IS NULL) AS null_product_id,
  COUNT(*) FILTER (WHERE price IS NULL) AS null_price,
  COUNT(*) FILTER (WHERE freight_value IS NULL) AS null_freight
FROM order_items;

--check for any price = 0 
SELECT COUNT(*) AS zero_price_items
FROM order_items
WHERE price = 0;

-- free shipping orders
SELECT COUNT(*) AS zero_freight_items
FROM order_items
WHERE freight_value = 0;


-- check for duplicates
SELECT order_id, order_item_id, COUNT(*) AS count
FROM order_items
GROUP BY order_id, order_item_id
HAVING COUNT(*) > 1;