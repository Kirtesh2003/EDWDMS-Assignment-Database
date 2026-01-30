USE extraordinary_shop;

CREATE OR REPLACE VIEW vw_product_revenue_rank AS
WITH sales AS (
  SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS gross_sales
  FROM order_item oi
  JOIN product p ON p.product_id = oi.product_id
  GROUP BY p.product_id, p.product_name
)
SELECT
  product_id,
  product_name,
  units_sold,
  gross_sales,
  RANK() OVER (ORDER BY gross_sales DESC) AS revenue_rank
FROM sales;
