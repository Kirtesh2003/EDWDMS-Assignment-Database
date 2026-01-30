DELIMITER $$

CREATE FUNCTION fn_order_paid_total(p_order_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE v_paid DECIMAL(10,2);
  SELECT IFNULL(SUM(amount),0) INTO v_paid
  FROM payment
  WHERE order_id = p_order_id;
  RETURN v_paid;
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE sp_mark_overdue_orders(IN p_today DATE)
BEGIN
  UPDATE orders o
  SET o.is_overdue = TRUE
  WHERE o.status IN ('PENDING','CONFIRMED')
    AND o.expected_delivery_date IS NOT NULL
    AND o.expected_delivery_date < p_today
    AND fn_order_paid_total(o.order_id) < o.total_amount;
END$$

DELIMITER ;


SELECT fn_order_paid_total(1) AS order1_paid_total;
CALL sp_mark_overdue_orders('2026-02-20');
SELECT order_id, status, expected_delivery_date, total_amount, is_overdue FROM orders ORDER BY order_id;

