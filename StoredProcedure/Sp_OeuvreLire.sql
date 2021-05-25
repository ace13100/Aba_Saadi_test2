
DELIMITER //
DROP PROCEDURE IF EXISTS Sp_OeuvreLire//
CREATE PROCEDURE Sp_OeuvreLire(oeuId INT) 
BEGIN
	SELECT libOeu
    FROM oeuvre
    WHERE IdOeu = oeuId;
END//
