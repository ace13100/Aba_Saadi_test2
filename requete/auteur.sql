use tableaux;
INSERT INTO auteur (nomAut)
VALUES ('ggg');

UPDATE auteur 
SET nomAut = 'ggggggg'
WHERE nomAut = 'ggg' ;

SELECT * 
FROM auteur;


-- delete avec les FK
DELETE oeu
FROM oeuvre oeu inner join auteur aut on oeu.idAut = aut.idAut
WHERE nomAut = 'ggggggg' ;

DELETE 
FROM auteur
WHERE nomAut = 'ggggggg' ;

SELECT * 
FROM auteur;