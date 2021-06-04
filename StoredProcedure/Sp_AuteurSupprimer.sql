DELIMITER //
DROP PROCEDURE IF EXISTS Sp_AuteurSupprimer//
CREATE PROCEDURE Sp_AuteurSupprimer(autID INT) 
BEGIN

    DECLARE message VARCHAR(512);
    DECLARE existe SMALLINT;

    SET message = '';

    SELECT COUNT(idAut)
    INTO   existe
    FROM   auteur
    WHERE  idAut = autId;

    IF(existe = 0) THEN
    	SET message = CONCAT('L\'auteur ',  autId, ' n\'existe pas');
    END IF;

    IF(message = '') THEN
		
        UPDATE oeuvre
		SET    idAut = NULL
		WHERE  idAut = autID;
		DELETE 
		FROM auteur
		WHERE idAut = autID;

	END IF;
	
	SELECT message;

END//