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
	
		UPDATE oeuvre
		SET    idOeu   = NULL
		WHERE  idOeu   = greId;

		DELETE oeug
		FROM oeuvre_genre oeug inner join genre gre on gre.idGre = oeug.idGre
		WHERE idGre = greId ;
		DELETE 
		FROM genre
		WHERE idGre = greId ;

	END IF;
	
	SELECT message;

END//