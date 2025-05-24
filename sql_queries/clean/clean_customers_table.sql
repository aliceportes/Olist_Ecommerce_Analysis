SELECT * FROM customers LIMIT 10;

-- capitalize customer_city for display purposes
UPDATE customers
SET customer_city = 
    REGEXP_REPLACE(
        INITCAP(customer_city),
        '\m(Do|Da|De|Dos|Das)\M',
        LOWER('\1'),
        'g'
    );

-- check for nuuls in city/state
SELECT * FROM customers WHERE customer_city IS NULL OR customer_state IS NULL;

-- check for duplicates
SELECT 
  COUNT(*) AS total_rows,
  COUNT(DISTINCT customer_id) AS distinct_ids
FROM customers;