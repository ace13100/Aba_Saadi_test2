DELIMITER //
DROP PROCEDURE IF EXISTS Sp_OeuvreModifier//
CREATE PROCEDURE Sp_OeuvreModifier(OeuId INT, OeuLib VARCHAR(128), greId INT) 
BEGIN

    DECLARE message VARCHAR(512);
    DECLARE existe SMALLINT;
	DECLARE doublon SMALLINT;
	DECLARE existeGenre SMALLINT;

    SET message = '';

    SELECT COUNT(idOeu)
    INTO   existe
    FROM   oeuvre
    WHERE  idOeu = OeuId;

    IF(existe = 0) THEN
    	SET message = CONCAT('Le titre ',  OeuId, ' n\'existe pas');
    END IF;

    SELECT COUNT(idOeu)
    INTO   doublon
    FROM   oeuvre
    WHERE  LOWER(libOeu) = LOWER(OeuLib)
	AND    idOeu <> OeuId;
    
    IF(doublon > 0) THEN
    	SET message = CONCAT(message, 'Un autre titre avec ce nom ',  OeuLib, ' existe déjà');
    END IF;

    IF(greId IS NOT NULL) THEN

		SELECT COUNT(idGre)
		INTO   existeGenre
		FROM   genre
		WHERE  idGre = greId;

		IF(existeGenre = 0) THEN
			SET message = CONCAT('Le genre ',  greId, ' n\'existe pas');
		END IF;
	
	END IF;

    IF(message = '') THEN
		UPDATE oeuvre
		SET libOeu = OeuLib,
		    idGre = greId
		WHERE idOeu = OeuId;
	END IF;
	
	SELECT message;

END//
