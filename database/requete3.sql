-- info sur les dessins evalués
SELECT DISTINCT
    dessin.numDessin,
    YEAR(dessin.dateRemise) as 'date de remise',
    concours.theme,
    comp.nom AS 'competiteur',
    dessin.commentaire as 'commentaire competiteur',
    eva.nom AS 'evaluateur',
    evaluation.commentaire as 'commentaire evaluateur',
    evaluation.note
from concours,dessin,participationcompetiteur,evaluation,utilisateur comp,utilisateur eva,participationevaluateur
where dessin.numCompetiteur=participationcompetiteur.numCompetiteur
and participationcompetiteur.numCompetiteur=comp.numUtilisateur
and participationcompetiteur.numConcours=concours.numConcours 
and dessin.numDessin IN (SELECT evaluation.numDessin from evaluation)
and evaluation.numDessin=dessin.numDessin
and participationevaluateur.numEvaluateur=eva.numUtilisateur
and participationevaluateur.numEvaluateur=evaluation.numEvaluateur