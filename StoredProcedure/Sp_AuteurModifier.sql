DELIMITER //
DROP PROCEDURE IF EXISTS Sp_AuteurModifier//
CREATE PROCEDURE Sp_AuteurModifier(autId INT, autNom VARCHAR(128)) 
BEGIN

    DECLARE message VARCHAR(512);
    DECLARE existe SMALLINT;
	DECLARE doublon SMALLINT;

    SET message = '';

    SELECT COUNT(idAut)
    INTO   existe
    FROM   auteur
    WHERE  idAut = autId;

    IF(existe = 0) THEN
    	SET message = CONCAT('L\'auteur ',  autId, ' n\'existe pas');
    END IF;

    SELECT COUNT(idAut)
    INTO   doublon
    FROM   auteur
    WHERE  LOWER(nomAut) = LOWER(autNom)
	AND    idAut <> autId;
    
    IF(doublon > 0) THEN
    	SET message = CONCAT(message, 'Un autre auteur avec ce nom ',  autNom, ' existe déjà');
    END IF;

    IF(message = '') THEN
		UPDATE auteur
		SET nomAut = autNom
		WHERE idAut = autId;
	END IF;
	
	SELECT message;

END//