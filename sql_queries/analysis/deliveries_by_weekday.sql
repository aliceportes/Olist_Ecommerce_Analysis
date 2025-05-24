-- delivered orders by weekday
SELECT 
  TO_CHAR(order_delivered_customer_date, 'Day') AS weekday,
  EXTRACT(DOW FROM order_delivered_customer_date) AS weekday_number,
  COUNT(*) AS total_deliveries
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
GROUP BY weekday, weekday_number
ORDER BY weekday_number;
