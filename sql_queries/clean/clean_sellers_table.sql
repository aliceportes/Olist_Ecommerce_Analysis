SELECT * FROM sellers LIMIT 10;

--check for nulls
SELECT 
  COUNT(*) FILTER (WHERE seller_id IS NULL) AS null_id,
  COUNT(*) FILTER (WHERE seller_city IS NULL) AS null_city,
  COUNT(*) FILTER (WHERE seller_state IS NULL) AS null_state
FROM sellers;


--captalize city names
UPDATE sellers
SET seller_city = REGEXP_REPLACE(
  INITCAP(seller_city),
  '\m(Do|Da|De|Dos|Das)\M',
  LOWER('\1'),
  'g'
);

--check for duplicates sellers
SELECT seller_id, COUNT(*)
FROM sellers
GROUP BY seller_id
HAVING COUNT(*) > 1;