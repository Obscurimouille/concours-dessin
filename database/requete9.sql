SELECT DISTINCT
utilisateur.nom as 'nom de l_evaluateur',
club.region,
evaluateur.specialite,
avg(evaluation.note) as 'note moyenne'
from evaluation,evaluateur,utilisateur,participationevaluateur,club
WHERE evaluateur.numEvaluateur=utilisateur.numUtilisateur
and evaluation.numEvaluateur=evaluateur.numEvaluateur
and club.numClub=participationevaluateur.numConcours
and evaluateur.numEvaluateur=participationevaluateur.numEvaluateur
and club.region IN (
    SELECT club.region FROM club where upper(club.region)='BRETAGNE'
    )
GROUP BY 'nom de l_evaluateur'
ORDER BY 'note moyenne' ASC