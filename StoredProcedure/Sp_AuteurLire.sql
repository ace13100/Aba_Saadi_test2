DELIMITER //
DROP PROCEDURE IF EXISTS Sp_AuteurLire//
CREATE PROCEDURE Sp_AuteurLire(autId INT) 
BEGIN
	SELECT nomAut
    FROM auteur
    WHERE idAut = autId;
END//