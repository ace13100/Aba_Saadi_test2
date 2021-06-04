INSERT INTO genre(libGre)
VALUES ('genre');

UPDATE genre
SET libGre = 'genre2'
WHERE idGre = 'genre';

SELECT * 
FROM genre;
-- delete avec les FK
DELETE 
FROM oeuvre_genre  
WHERE idGre = greId ;
DELETE 
FROM genre
WHERE idGre = greId ;

SELECT * 
FROM genre;