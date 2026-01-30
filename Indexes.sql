USE extraordinary_shop;

CREATE INDEX idx_orders_customer_date ON orders(customer_id, order_date);
CREATE INDEX idx_orders_status_delivery ON orders(status, expected_delivery_date);
CREATE INDEX idx_order_item_order_product ON order_item(order_id, product_id);
CREATE INDEX idx_payment_order ON payment(order_id);
CREATE INDEX idx_inventory_product_stock ON inventory(product_id, stock_qty);
CREATE INDEX idx_product_supplier_product ON product_supplier(product_id);
CREATE INDEX idx_customer_status ON customer(status);
