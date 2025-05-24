SELECT * FROM products LIMIT 10;


--check for duplicates
SELECT product_id, COUNT(*) AS count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

--checking for nulls
SELECT 
  COUNT(*) FILTER (WHERE product_id IS NULL) AS null_id,
  COUNT(*) FILTER (WHERE product_category_name IS NULL) AS null_category,
  COUNT(*) FILTER (WHERE product_weight_g IS NULL) AS null_weight,
  COUNT(*) FILTER (WHERE product_length_cm IS NULL) AS null_length,
  COUNT(*) FILTER (WHERE product_height_cm IS NULL) AS null_height,
  COUNT(*) FILTER (WHERE product_width_cm IS NULL) AS null_width
FROM products;

--drop missing dimensions/weight
DELETE FROM products
WHERE product_weight_g IS NULL
   OR product_length_cm IS NULL
   OR product_height_cm IS NULL
   OR product_width_cm IS NULL;

   
-- handle missing category names
UPDATE products
SET product_category_name = 'unknown'
WHERE product_category_name IS NULL;

--check for unusual values
SELECT *
FROM products
WHERE product_weight_g = 0
   OR product_length_cm = 0
   OR product_height_cm = 0
   OR product_width_cm = 0;


SELECT COUNT(*) AS zero_weight_products
FROM products
WHERE product_weight_g = 0;

--drop product_weight_g = 0
DELETE FROM products
WHERE product_weight_g = 0;


-- add missing product category translations to the translation table
INSERT INTO product_category_name_translation (product_category_name, product_category_name_english)
VALUES 
  ('pc_gamer', 'pc_gamer'),
  ('portateis_cozinha_e_preparadores_de_alimentos', 'portable_kitchen_and_food_preparers');


--add a new column to the products table to store English category names
ALTER TABLE products
ADD COLUMN category_name_en TEXT;

--ppdate new column with translated category names where a match is found in the translation table
UPDATE products
SET category_name_en = 
  CASE 
    WHEN t.product_category_name_english IS NOT NULL THEN t.product_category_name_english
    ELSE 'unknown'
  END
FROM product_category_name_translation t
WHERE products.product_category_name = t.product_category_name;

--fill in 'unknown' for products that had no matching translation record at al
UPDATE products
SET category_name_en = 'unknown'
WHERE category_name_en IS NULL;

