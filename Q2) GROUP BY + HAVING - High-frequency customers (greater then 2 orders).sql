SELECT
  customer_id,
  COUNT(*) AS orders_count,
  ROUND(SUM(total_amount),2) AS spend
FROM orders
GROUP BY customer_id
HAVING COUNT(*) >= 2
ORDER BY spend DESC;
