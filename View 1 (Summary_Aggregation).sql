USE extraordinary_shop;
CREATE OR REPLACE VIEW vw_monthly_revenue_summary AS
SELECT
  DATE_FORMAT(order_date, '%Y-%m-01') AS month_start,
  COUNT(*) AS orders_count,
  SUM(subtotal) AS subtotal_sum,
  SUM(discount_total) AS discount_sum,
  SUM(total_amount) AS revenue_sumvw_product_revenue_rank
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m-01');
