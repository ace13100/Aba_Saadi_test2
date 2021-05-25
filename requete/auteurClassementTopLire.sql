select nomAut, count(idOeu) nbOeuvre from auteur aut
inner join oeuvre oeu on oeu.idAut =aut.idAut
group by aut.nomAut
order by  count(idOeu) desc
LIMIT 1