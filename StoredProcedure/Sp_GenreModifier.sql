DELIMITER //
DROP PROCEDURE IF EXISTS Sp_GenreModifier//
CREATE PROCEDURE Sp_GenreModifier(greId INT, greLib VARCHAR(128)) 
BEGIN

    DECLARE message VARCHAR(512);
    DECLARE existe SMALLINT;
	DECLARE doublon SMALLINT;

    SET message = '';

    SELECT COUNT(idGre)
    INTO   existe
    FROM   genre
    WHERE  idGre = greId;

    IF(existe = 0) THEN
    	SET message = CONCAT('Le genre ',  greId, ' n\'existe pas');
    END IF;

    SELECT COUNT(idGre)
    INTO   doublon
    FROM   genre
    WHERE  LOWER(libGre) = LOWER(greLib)
	AND    idGre <> greId;
    
    IF(doublon > 0) THEN
    	SET message = CONCAT(message, 'Un autre genre avec ce nom ',  greLib, ' existe déjà');
    END IF;

    IF(message = '') THEN
		UPDATE genre
		SET libGre = greLib
		WHERE idGre = greId;
	END IF;
	
	SELECT message;

END//