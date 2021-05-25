INSERT INTO oeuvre(liboeu,idAut)
VALUES ('titre',2);


UPDATE oeuvre
SET libOeu = 'titre2'
WHERE libOeu = 'titre';

SELECT * 
FROM oeuvre;

-- delete avec les FK
DELETE oeg
FROM oeuvre_genre oeg inner join oeuvre oeu on oeu.idoeu= oeg.idOeu
WHERE libOeu = 'titre2' ;

DELETE 
FROM oeuvre
WHERE libOeu = 'titre2' ;

SELECT * 
FROM oeuvre;