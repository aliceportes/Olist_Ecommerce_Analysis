-- percentage of orders by payment type
WITH payment_count AS (
  SELECT 
    payment_type,
    COUNT(*) AS total
  FROM order_payments
  GROUP BY payment_type
),
total_all AS (
  SELECT SUM(total) AS grand_total FROM payment_count
)
SELECT 
  p.payment_type,
  p.total,
  ROUND((p.total::NUMERIC / t.grand_total) * 100, 2) AS percentage
FROM payment_count p
CROSS JOIN total_all t
ORDER BY percentage DESC;