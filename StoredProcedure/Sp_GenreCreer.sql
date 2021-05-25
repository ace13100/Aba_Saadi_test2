DELIMITER //
DROP PROCEDURE IF EXISTS Sp_GenreCreer//
CREATE PROCEDURE Sp_GenreCreer(greLib VARCHAR(128)) 
BEGIN

    DECLARE message VARCHAR(512);
    DECLARE existe SMALLINT;
    DECLARE newId INT;
    
    SET message = '';
    SET newId = -1;
    
    SELECT COUNT(idGre)
    INTO   existe
    FROM   genre
    WHERE  LOWER(libGre) = LOWER(greLib);
    
    IF(existe > 0) THEN
    	SET message = CONCAT('Le genre ',  greLib, ' existe déjà');
    END IF;

    IF(message = '') THEN
	    INSERT INTO genre (libGre)
        VALUES (greLib);
	
        SELECT LAST_INSERT_ID()
	    INTO   newId;
    END IF;
    
    SELECT message, newId;

END//







