-- count of reviews by score
SELECT 
  review_score,
  COUNT(*) AS total_reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score DESC;