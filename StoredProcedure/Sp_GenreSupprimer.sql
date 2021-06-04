DELIMITER //
DROP PROCEDURE IF EXISTS Sp_GenreSupprimer//
CREATE PROCEDURE Sp_GenreSupprimer(greId INT) 
BEGIN

    DECLARE message VARCHAR(512);
    DECLARE existe SMALLINT;

    SET message = '';

    SELECT COUNT(idGre)
    INTO   existe
    FROM   genre
    WHERE  idGre = greId;

    IF(existe = 0) THEN
    	SET message = CONCAT('Le genre ',  greId, ' n\'existe pas');
    END IF;

    IF(message = '') THEN
	
		DELETE 
		FROM oeuvre_genre  
		WHERE idGre = greId ;
		DELETE 
		FROM genre
		WHERE idGre = greId ;
        
	END IF;
	
	SELECT message;

END//