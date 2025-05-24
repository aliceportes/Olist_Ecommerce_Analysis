SELECT * FROM geolocation LIMIT 10;

/* check for duplicates:
contains potential duplicates, will clean if needed for mapping or location analysis
*/
SELECT COUNT(*) - COUNT(DISTINCT ROW (
  geolocation_zip_code_prefix,
  geolocation_lat,
  geolocation_lng,
  geolocation_city,
  geolocation_state
)) AS exact_duplicate_count
FROM geolocation;

--check for nulls
SELECT 
  COUNT(*) FILTER (WHERE geolocation_zip_code_prefix IS NULL) AS null_zip,
  COUNT(*) FILTER (WHERE geolocation_lat IS NULL) AS null_lat,
  COUNT(*) FILTER (WHERE geolocation_lng IS NULL) AS null_lng,
  COUNT(*) FILTER (WHERE geolocation_city IS NULL) AS null_city,
  COUNT(*) FILTER (WHERE geolocation_state IS NULL) AS null_state
FROM geolocation;

-- enable unaccent extension
CREATE EXTENSION IF NOT EXISTS unaccent;

--remove accents from city names 
UPDATE geolocation
SET geolocation_city = unaccent(geolocation_city);


--captalize city names
UPDATE geolocation
SET geolocation_city = REGEXP_REPLACE(
  INITCAP(geolocation_city),
  '\m(Do|Da|De|Dos|Das)\M',
  LOWER('\1'),
  'g'
);
