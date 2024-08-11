--  SQL script that creates a function SafeDiv that divides (and returns) the first by the second number or returns 0 if the second number is equal to 0

DELIMITER $$

CREATE FUNCTION safeDiv(a INT, b INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE result FLOAT;

	IF b != 0 THEN
		SET result = a / b;
		RETURN result;
	ELSE
		RETURN 0;
	END IF;
END$$
DELIMITER ;
