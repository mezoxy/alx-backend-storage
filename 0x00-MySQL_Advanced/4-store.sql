-- Write a SQL script that creates a trigger that decreases the quantity of an item after adding a new order.

--DELIMITER $$
--CREATE TRIGGER updat_quantity
--AFTER INSERT ON orders
--FOR EACH ROW
--BEGIN
--	UPDATE items
--	INNER JOIN (
--		    SELECT item_name, SUM(number) AS total_orders
---		    FROM orders
--		    GROUP BY item_name
--	) AS order_totals ON items.name = order_totals.item_name
--	SET items.quantity = items.quantity - order_totals.total_orders
--	WHERE order_totals.item_name = items.name;
--END$$
--iDELIMITER;
DELIMITER $$

CREATE TRIGGER update_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
	UPDATE items
	SET items.quantity = items.quantity - NEW.number
	WHERE items.name = NEW.item_name;
END$$

DELIMITER ;
