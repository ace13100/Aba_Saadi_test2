use Tableaux;
DROP TABLE IF EXISTS genre;
CREATE TABLE genre 
(
	idGre INT UNSIGNED NOT NULL auto_increment,
    libGre VARCHAR(128) NOT NULL,
    PRIMARY KEY (idGre)
    
) ENGINE = InnoDB;


DROP TABLE IF EXISTS auteur;
CREATE TABLE auteur
(
	idAut INT UNSIGNED NOT NULL auto_increment,
    nomAut VARCHAR(128) NOT NULL,
    PRIMARY KEY (idAut)
) ENGINE = InnoDB;



DROP TABLE IF EXISTS oeuvre;
CREATE TABLE oeuvre
(
	idOeu INT UNSIGNED NOT NULL auto_increment,
    libOeu VARCHAR(128) NOT NULL,
    idAut INT UNSIGNED NOT NULL,
    PRIMARY KEY (idOeu),
    CONSTRAINT fk_titrea FOREIGN KEY (idAut) REFERENCES auteur(idAut)
   
    
) ENGINE = InnoDB;

DROP TABLE IF EXISTS oeuvre_genre;
CREATE TABLE oeuvre_genre
(
	idGre INT UNSIGNED NOT NULL , 
    idOeu INT UNSIGNED NOT NULL,
    UNIQUE (idGre, idOeu),
    CONSTRAINT fk_genretOEu
    FOREIGN KEY (idGre)
    REFERENCES genre(idGre),
    CONSTRAINT fk_auteurOe
    FOREIGN KEY (idOeu)
    REFERENCES oeuvre(idOeu)
) ENGINE = InnoDB;
