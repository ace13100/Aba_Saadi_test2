use tableaux;
INSERT INTO auteur (nomAut)
VALUES ('ggg');

UPDATE auteur 
SET nomAut = 'ggggggg'
WHERE nomAut = 'ggg' ;

SELECT * 
FROM auteur;


-- delete avec les FK
UPDATE oeuvre
SET    idAut = NULL
WHERE  idAut = autID;
DELETE 
FROM auteur
WHERE idAut = autID;

SELECT * 
FROM auteur;