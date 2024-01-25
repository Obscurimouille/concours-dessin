select 
	club.region AS 'REGION',
    AVG(evaluation.note) AS NOTE_MOYENNE
from evaluation,club,participationclub,concours,dessin,participationevaluateur
where club.numClub=participationclub.numClub
and participationclub.numConcours=concours.numConcours
and evaluation.numEvaluateur=participationevaluateur.numEvaluateur
and participationevaluateur.numConcours=concours.numConcours
and evaluation.numDessin=dessin.numDessin
GROUP BY club.region
