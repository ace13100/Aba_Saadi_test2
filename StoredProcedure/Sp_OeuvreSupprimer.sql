DELIMITER //
DROP PROCEDURE IF EXISTS Sp_OeuvreSupprimer//
CREATE PROCEDURE Sp_OeuvreSupprimer(OeuId INT) 
BEGIN

    DECLARE message VARCHAR(512);
    DECLARE existe SMALLINT;

    SET message = '';

    SELECT COUNT(idOeu)
    INTO   existe
    FROM   titre
    WHERE  idOeu = OeuId;

    IF(existe = 0) THEN
    	SET message = CONCAT('Le titre ',  OeuId, ' n\'existe pas');
    END IF;

    IF(message = '') THEN
	
		DELETE 
		FROM  oeuvre_genre
		WHERE idOeu = OeuId;

		DELETE 
		FROM  oeuvre
		WHERE idOeu = OeuId;

	END IF;
	
	SELECT message;

END//