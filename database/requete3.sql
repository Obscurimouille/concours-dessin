-- info sur les dessins evalués
SELECT DISTINCT
    dessin.numDessin,
    YEAR(dessin.dateRemise) as 'date de remise',
    concours.theme
from concours,dessin,participationcompetiteur,evaluation
where dessin.numCompetiteur=participationcompetiteur.numCompetiteur 
and participationcompetiteur.numConcours=concours.numConcours 
and dessin.numDessin IN (SELECT evaluation.numDessin from evaluation)