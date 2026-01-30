USE extraordinary_shop;

-- =========================
-- CORE ENTITIES
-- =========================
CREATE TABLE customer (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name  VARCHAR(50) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  phone VARCHAR(25) NOT NULL UNIQUE,
  status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_customer_status CHECK (status IN ('ACTIVE','SUSPENDED','CLOSED'))
) ENGINE=InnoDB;

CREATE TABLE address (
  address_id INT AUTO_INCREMENT PRIMARY KEY,
  line1 VARCHAR(120) NOT NULL,
  city VARCHAR(60) NOT NULL,
  country VARCHAR(60) NOT NULL DEFAULT 'UK',
  postcode VARCHAR(12) NOT NULL
) ENGINE=InnoDB;

-- M:N #1 customer <-> address
CREATE TABLE customer_address (
  customer_id INT NOT NULL,
  address_id INT NOT NULL,
  address_type VARCHAR(20) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (customer_id, address_id, address_type),
  CONSTRAINT fk_ca_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  CONSTRAINT fk_ca_address  FOREIGN KEY (address_id)  REFERENCES address(address_id),
  CONSTRAINT chk_address_type CHECK (address_type IN ('BILLING','SHIPPING'))
) ENGINE=InnoDB;

-- =========================
-- PRODUCT CATALOG
-- =========================
CREATE TABLE category (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(80) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE product (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(120) NOT NULL,
  description TEXT NULL,
  price DECIMAL(10,2) NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT chk_price CHECK (price >= 0)
) ENGINE=InnoDB;

-- M:N #2 product <-> category
CREATE TABLE product_category (
  product_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (product_id, category_id),
  CONSTRAINT fk_pc_product  FOREIGN KEY (product_id) REFERENCES product(product_id),
  CONSTRAINT fk_pc_category FOREIGN KEY (category_id) REFERENCES category(category_id)
) ENGINE=InnoDB;

CREATE TABLE supplier (
  supplier_id INT AUTO_INCREMENT PRIMARY KEY,
  supplier_name VARCHAR(120) NOT NULL UNIQUE,
  contact_phone VARCHAR(25) NULL
) ENGINE=InnoDB;

-- M:N #3 product <-> supplier
CREATE TABLE product_supplier (
  product_id INT NOT NULL,
  supplier_id INT NOT NULL,
  supply_cost DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (product_id, supplier_id),
  CONSTRAINT fk_ps_product  FOREIGN KEY (product_id) REFERENCES product(product_id),
  CONSTRAINT fk_ps_supplier FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id),
  CONSTRAINT chk_supply_cost CHECK (supply_cost >= 0)
) ENGINE=InnoDB;

-- =========================
-- WAREHOUSING
-- =========================
CREATE TABLE warehouse (
  warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
  warehouse_name VARCHAR(80) NOT NULL UNIQUE,
  city VARCHAR(60) NOT NULL
) ENGINE=InnoDB;

-- M:N #4 warehouse <-> product (inventory junction)
CREATE TABLE inventory (
  warehouse_id INT NOT NULL,
  product_id INT NOT NULL,
  stock_qty INT NOT NULL DEFAULT 0,
  reorder_level INT NOT NULL DEFAULT 10,
  PRIMARY KEY (warehouse_id, product_id),
  CONSTRAINT fk_inv_wh FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id),
  CONSTRAINT fk_inv_prod FOREIGN KEY (product_id) REFERENCES product(product_id),
  CONSTRAINT chk_stock_qty CHECK (stock_qty >= 0),
  CONSTRAINT chk_reorder_level CHECK (reorder_level >= 0)
) ENGINE=InnoDB;

-- =========================
-- ORDERS, PAYMENTS, SHIPPING
-- =========================
CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
  subtotal DECIMAL(10,2) NOT NULL DEFAULT 0,
  discount_total DECIMAL(10,2) NOT NULL DEFAULT 0,
  total_amount DECIMAL(10,2) NOT NULL DEFAULT 0,
  expected_delivery_date DATE NULL,
  is_overdue BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  CONSTRAINT chk_order_status CHECK (status IN ('PENDING','CONFIRMED','SHIPPED','DELIVERED','CANCELLED')),
  CONSTRAINT chk_order_money CHECK (subtotal >= 0 AND discount_total >= 0 AND total_amount >= 0)
) ENGINE=InnoDB;

-- Junction (orders <-> products): line items
CREATE TABLE order_item (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  CONSTRAINT fk_oi_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_oi_product FOREIGN KEY (product_id) REFERENCES product(product_id),
  CONSTRAINT chk_oi_qty CHECK (quantity > 0),
  CONSTRAINT chk_oi_price CHECK (unit_price >= 0)
) ENGINE=InnoDB;

CREATE TABLE payment (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  paid_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  amount DECIMAL(10,2) NOT NULL,
  method VARCHAR(20) NOT NULL,
  CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
  CONSTRAINT chk_payment_amount CHECK (amount > 0),
  CONSTRAINT chk_payment_method CHECK (method IN ('CARD','BANK_TRANSFER','PAYPAL'))
) ENGINE=InnoDB;

CREATE TABLE shipment (
  shipment_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL UNIQUE,
  warehouse_id INT NOT NULL,
  shipped_on DATE NULL,
  delivered_on DATE NULL,
  carrier VARCHAR(40) NULL,
  tracking_number VARCHAR(40) NULL UNIQUE,
  CONSTRAINT fk_ship_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_ship_wh    FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id),
  CONSTRAINT chk_ship_dates CHECK (
    delivered_on IS NULL OR shipped_on IS NULL OR delivered_on >= shipped_on
  )
) ENGINE=InnoDB;

-- =========================
-- PROMOTIONS + LOYALTY (EXTRAORDINARY PART)
-- =========================
CREATE TABLE promotion (
  promo_id INT AUTO_INCREMENT PRIMARY KEY,
  promo_code VARCHAR(30) NOT NULL UNIQUE,
  promo_type VARCHAR(20) NOT NULL,
  value DECIMAL(10,2) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  CONSTRAINT chk_promo_type CHECK (promo_type IN ('PERCENT','FIXED')),
  CONSTRAINT chk_promo_dates CHECK (end_date >= start_date),
  CONSTRAINT chk_promo_value CHECK (value > 0)
) ENGINE=InnoDB;

-- M:N #5 orders <-> promotion
CREATE TABLE order_promotion (
  order_id INT NOT NULL,
  promo_id INT NOT NULL,
  applied_amount DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (order_id, promo_id),
  CONSTRAINT fk_op_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_op_promo FOREIGN KEY (promo_id) REFERENCES promotion(promo_id),
  CONSTRAINT chk_applied_amount CHECK (applied_amount >= 0)
) ENGINE=InnoDB;

CREATE TABLE loyalty_account (
  loyalty_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL UNIQUE,
  points_balance INT NOT NULL DEFAULT 0,
  tier VARCHAR(15) NOT NULL DEFAULT 'BRONZE',
  CONSTRAINT fk_loyalty_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  CONSTRAINT chk_points_balance CHECK (points_balance >= 0),
  CONSTRAINT chk_tier CHECK (tier IN ('BRONZE','SILVER','GOLD','PLATINUM'))
) ENGINE=InnoDB;

SHOW TABLES;



CREATE TABLE loyalty_txn (
  txn_id INT AUTO_INCREMENT PRIMARY KEY,
  loyalty_id INT NOT NULL,
  txn_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  points_change INT NOT NULL,
  reason VARCHAR(60) NOT NULL,
  CONSTRAINT fk_txn_loyalty FOREIGN KEY (loyalty_id) REFERENCES loyalty_account(loyalty_id)
) ENGINE=InnoDB;
