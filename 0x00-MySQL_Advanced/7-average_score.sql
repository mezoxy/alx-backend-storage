-- Write a SQL script that creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student.

DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(IN id INT)
BEGIN
	DECLARE somme INT;
	SELECT AVG(score) INTO somme FROM corrections GROUP BY user_id;

	UPDATE INTO users
	SET average_score = somme
	WHERE users.id = id;
END;
DELIMITER ;
