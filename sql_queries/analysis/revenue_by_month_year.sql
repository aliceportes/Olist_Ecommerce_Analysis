-- monthly revenue by year (for multi-line chart)
SELECT 
  EXTRACT(YEAR FROM o.order_delivered_customer_date) AS year,
  TO_CHAR(o.order_delivered_customer_date, 'Mon') AS month_name,
  EXTRACT(MONTH FROM o.order_delivered_customer_date) AS month_number,
  ROUND(SUM(oi.price + oi.freight_value), 2) AS revenue
FROM order_items oi
JOIN orders_clean o ON oi.order_id = o.order_id
GROUP BY year, month_name, month_number
ORDER BY month_number, year;