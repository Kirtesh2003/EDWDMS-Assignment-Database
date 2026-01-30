SELECT *
FROM (
  SELECT
    o.customer_id,
    ROUND(SUM(o.total_amount),2) AS total_spend,
    DENSE_RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS spend_rank
  FROM orders o
  GROUP BY o.customer_id
) ranked
WHERE spend_rank <= 5
ORDER BY spend_rank;
