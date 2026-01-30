SELECT
  p.product_id,
  p.product_name,
  (SELECT SUM(i.stock_qty)
   FROM inventory i
   WHERE i.product_id = p.product_id) AS total_stock
FROM product p
WHERE (SELECT SUM(i.stock_qty) FROM inventory i WHERE i.product_id = p.product_id) < 150
ORDER BY total_stock ASC;
