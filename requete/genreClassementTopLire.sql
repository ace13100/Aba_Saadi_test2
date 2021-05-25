select libGre,count(oeu.idGre) Nbgre from genre gre
inner join  oeuvre_genre oeu on gre.idgre= oeu.idgre
GROUP BY gre.libGre
order by count(idgre) desc
limit 1;