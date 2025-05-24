-- orders by month and year
SELECT 
  EXTRACT(YEAR FROM order_delivered_customer_date) AS year,
  TO_CHAR(order_delivered_customer_date, 'Mon') AS month_name,
  EXTRACT(MONTH FROM order_delivered_customer_date) AS month_number,
  COUNT(*) AS order_count
FROM orders_clean
GROUP BY year, month_name, month_number
ORDER BY month_number, year;