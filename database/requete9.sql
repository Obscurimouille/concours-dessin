SELECT DISTINCT
utilisateur.nom as 'nom de l_evaluateur',
evaluateur.specialite,
avg(evaluation.note) as 'note moyenne'
from evaluation,evaluateur,utilisateur
WHERE evaluateur.numEvaluateur=utilisateur.numUtilisateur
and evaluation.numEvaluateur=evaluateur.numEvaluateur
GROUP BY 'nom de l_evaluateur'
ORDER BY 'note moyenne' ASC