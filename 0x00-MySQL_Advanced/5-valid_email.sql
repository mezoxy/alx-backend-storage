-- reset only when we change the old email

DELIMITER $$
CREATE TRIGGER only
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
	IF OLD.email != NEW.email THEN
		SET NEW.valid_email = (SELECT COLUMN_DEFAULT FROM
		INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = 'users'
		AND COLUMN_NAME = 'valid_email');
	END if;
END$$
DELIMITER ;
