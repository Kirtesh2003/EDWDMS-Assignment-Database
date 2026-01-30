SELECT
  c.customer_id,
  c.status,
  COUNT(o.order_id) AS total_orders,
  SUM(CASE WHEN o.is_overdue = TRUE THEN 1 ELSE 0 END) AS overdue_orders,
  CASE
    WHEN c.status = 'SUSPENDED' THEN 'HIGH_RISK'
    WHEN SUM(CASE WHEN o.is_overdue = TRUE THEN 1 ELSE 0 END) >= 2 THEN 'HIGH_RISK'
    WHEN SUM(CASE WHEN o.is_overdue = TRUE THEN 1 ELSE 0 END) = 1 THEN 'MEDIUM_RISK'
    ELSE 'LOW_RISK'
  END AS risk_band
FROM customer c
LEFT JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.status
ORDER BY overdue_orders DESC, c.customer_id;
