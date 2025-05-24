-- total sellers
SELECT COUNT(DISTINCT seller_id) AS total_sellers
FROM order_items;