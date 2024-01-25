select 
	club.region AS 'REGION',
    AVG(evaluation.note) AS 'NOTE MOYENNE MAX'
from evaluation,club,participationclub,concours,dessin
where club.numClub=participationclub.numConcours
and participationclub.numConcours=concours.numConcours
and dessin.numDessin=concours.numConcours
and evaluation.numDessin=dessin.numDessin
GROUP BY club.region
HAVING 
AVG(evaluation.note) = (
        select max(A.b) from (select
            avg(evaluation.note) as b
        from evaluation,club,participationclub,concours,dessin
        where club.numClub=participationclub.numConcours
        and participationclub.numConcours=concours.numConcours
        and dessin.numDessin=concours.numConcours
        and evaluation.numDessin=dessin.numDessin
        GROUP BY club.region) AS A)