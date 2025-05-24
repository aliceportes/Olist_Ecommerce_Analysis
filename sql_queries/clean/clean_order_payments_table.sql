SELECT * FROM order_payments LIMIT 10;

--check for duplicate payment record
SELECT 
  order_id,
  payment_sequential,
  payment_type,
  payment_installments,
  payment_value,
  COUNT(*) AS duplicate_count
FROM order_payments
GROUP BY 
  order_id,
  payment_sequential,
  payment_type,
  payment_installments,
  payment_value
HAVING COUNT(*) > 1;

--check for nulls in key columns
SELECT 
  COUNT(*) FILTER (WHERE order_id IS NULL) AS null_order_id,
  COUNT(*) FILTER (WHERE payment_type IS NULL) AS null_type,
  COUNT(*) FILTER (WHERE payment_value IS NULL) AS null_value
FROM order_payments;

--check all distinct payment types
SELECT DISTINCT payment_type FROM order_payments;

--count number of rows with zero or negative payment values
SELECT 
  COUNT(*) AS zero_or_negative_payments
FROM order_payments
WHERE payment_value <= 0;

--view rows with zero or negative payment values
SELECT *
FROM order_payments
WHERE payment_value <= 0;

--count how many payments have type 'not_defined'
SELECT COUNT(*) AS not_defined_count
FROM order_payments
WHERE payment_type = 'not_defined';

--view details of 'not_defined' payment type
SELECT *
FROM order_payments
WHERE payment_type = 'not_defined';

--count how many payments use 'voucher'
SELECT COUNT(*) AS not_defined_count
FROM order_payments
WHERE payment_type = 'voucher';

--drop all rows where payment_value = 0
DELETE FROM order_payments
WHERE payment_value = 0;

