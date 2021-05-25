DELIMITER //
DROP PROCEDURE IF EXISTS Sp_AuteurCreer//
CREATE PROCEDURE Sp_AuteurCreer(autNom VARCHAR(128)) 
BEGIN

    DECLARE message VARCHAR(512);
    DECLARE existe SMALLINT;
    DECLARE newId INT;
    
    SET message = '';
    SET newId = -1;
    
    SELECT COUNT(idAut)
    INTO   existe
    FROM   auteur
    WHERE  LOWER(nomAut) = LOWER(autNom);
    
    IF(existe > 0) THEN
    	SET message = CONCAT('L\'auteur ',  autNom, ' existe déjà');
    END IF;

    IF(message = '') THEN
        INSERT INTO auteur (nomAut)
        VALUES (autNom);
	
        SELECT LAST_INSERT_ID()
	    INTO   newId;
    END IF;
    
    SELECT message, newId;
    
END//