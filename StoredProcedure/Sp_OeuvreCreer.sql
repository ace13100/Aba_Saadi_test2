DELIMITER //
DROP PROCEDURE IF EXISTS Sp_OeuvreCreer//
CREATE PROCEDURE Sp_OeuvreCreer(OeuLib VARCHAR(128), greId INT) 
BEGIN

    DECLARE message VARCHAR(512);
    DECLARE existe SMALLINT;
	DECLARE existeGenre SMALLINT;
    DECLARE newId INT;
    
    SET message = '';
    SET newId = -1;
    
    SELECT COUNT(idOeu)
    INTO   existe
    FROM   titre
    WHERE  LOWER(libOeu) = LOWER(OeuLib);
    
    IF(existe > 0) THEN
    	SET message = CONCAT('Le titre ',  oeuLib, ' existe déjà');
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
	    INSERT INTO oeuvre (libOeu, idGre)
        VALUES (OeuLib, greId);
	
        SELECT LAST_INSERT_ID()
	    INTO   newId;
    END IF;
    
    SELECT message, newId;

END//