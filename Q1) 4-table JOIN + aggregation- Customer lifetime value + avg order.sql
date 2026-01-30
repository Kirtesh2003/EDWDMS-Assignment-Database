SELECT
  c.customer_id,
  CONCAT(c.first_name,' ',c.last_name) AS customer_name,
  COUNT(DISTINCT o.order_id) AS orders_count,
  ROUND(SUM(o.total_amount),2) AS lifetime_spend,
  ROUND(AVG(o.total_amount),2) AS avg_order_value
FROM customer c
JOIN orders o ON o.customer_id = c.customer_id
LEFT JOIN payment p ON p.order_id = o.order_id
LEFT JOIN shipment s ON s.order_id = o.order_id
GROUP BY c.customer_id, customer_name
ORDER BY lifetime_spend DESC;
