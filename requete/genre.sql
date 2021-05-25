INSERT INTO genre(libGre)
VALUES ('genre');

UPDATE genre
SET libGre = 'genre2'
WHERE idGre = 'genre';

SELECT * 
FROM genre;
-- delete avec les FK
DELETE oeug
FROM oeuvre_genre oeug inner join genre gre on gre.idGre = oeug.idGre
WHERE libGre ='genre' ;
DELETE 
FROM genre
WHERE libGre ='genre' ;

SELECT * 
FROM genre;