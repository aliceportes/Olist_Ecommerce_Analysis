SELECT * FROM order_reviews LIMIT 10;

--Count how many reviews have comments
SELECT 
  COUNT(*) FILTER (WHERE review_comment_message IS NOT NULL) AS reviews_with_comments,
  COUNT(*) FILTER (WHERE review_comment_message IS NULL) AS reviews_without_comments
FROM order_reviews;

-- check for duplicate review_id entries
SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT review_id) AS unique_reviews,
       COUNT(*) - COUNT(DISTINCT review_id) AS duplicate_count
FROM order_reviews;

-- remove duplicate reviews, keeping the first instance of each review_id
DELETE FROM order_reviews
WHERE ctid NOT IN (
  SELECT MIN(ctid)
  FROM order_reviews
  GROUP BY review_id
);


SELECT COUNT(*) - COUNT(DISTINCT review_id) AS duplicate_count
FROM order_reviews;


-- add primary key constraint now that duplicates are removed
ALTER TABLE order_reviews
ADD CONSTRAINT order_reviews_pkey PRIMARY KEY (review_id);
