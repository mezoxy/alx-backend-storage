-- Write a SQL script that creates a stored procedure AddBonus that adds a new correction for a student.
-- Requirements:
-- 	Procedure AddBonus is taking 3 inputs (in this order):
--	user_id, a users.id value (you can assume user_id is linked to an existing users)
--	project_name, a new or already exists projects - if no projects.name found in the table, you should create it
--	score, the score value for the correction01~

DELIMITER $$
CREATE PROCEDURE AddBonus(IN user_id INT, IN pr_name VARCHAR(255), IN score INT)
BEGIN
	-- DECLARE id_pr INT;

	IF NOT EXISTS (SELECT id from projects WHERE name = pr_name) THEN
		INSERT INTO projects
		(name) VALUES (pr_name);

	END IF;

	SELECT id INTO id_pr FROM projects WHERE name = pr_name LIMIT 1; -- we can use another method: SET @id_pr = (select id from projects WHERE name = pr_name);

	INSERT INTO corrections (user_id, project_id, score)
	VALUES (user_id, @id_pr, score);
END$$
DELIMITER ;
