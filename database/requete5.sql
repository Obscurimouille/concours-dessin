select 
	club.region AS 'REGION',
    AVG(evaluation.note) AS NOTE_MOYENNE_MAX
from evaluation,club,participationclub,concours,dessin,participationevaluateur
where club.numClub=participationclub.numClub
and participationclub.numConcours=concours.numConcours
and evaluation.numEvaluateur=participationevaluateur.numEvaluateur
and participationevaluateur.numConcours=concours.numConcours
and evaluation.numDessin=dessin.numDessin
GROUP BY club.region
HAVING 
NOTE_MOYENNE_MAX = (
        select max(A.b) from (select
            avg(evaluation.note) as b
        from evaluation,club,participationclub,concours,dessin,participationevaluateur
        where club.numClub=participationclub.numClub
        and participationclub.numConcours=concours.numConcours
        and evaluation.numEvaluateur=participationevaluateur.numEvaluateur
        and participationevaluateur.numConcours=concours.numConcours
        and participationevaluateur.numConcours=concours.numConcours
        and evaluation.numDessin=dessin.numDessin
        GROUP BY club.region) AS A)