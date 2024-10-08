-- Write a SQL script that creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student.

DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(IN id INT)
BEGIN
	DECLARE somme DECIMAL(10, 2);
	SELECT AVG(score) INTO somme FROM corrections WHERE user_id = id GROUP BY user_id;

	UPDATE users
	SET average_score = somme
	WHERE users.id = id;
END$$
DELIMITER ;
