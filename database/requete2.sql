-- note des dessins evalués en 2024
SELECT DISTINCT
    dessin.numDessin,
    utilisateur.nom as nomCompetiteur,
    dessin.dateRemise,
    concours.theme,
    evaluation.note,
    evaluation.dateEvaluation
    
FROM dessin,evaluation,utilisateur,concours,competiteur,participationcompetiteur
where utilisateur.numUtilisateur=participationcompetiteur.numCompetiteur
and concours.numConcours=participationcompetiteur.numConcours
and dessin.numCompetiteur=participationcompetiteur.numCompetiteur
and evaluation.numDessin=dessin.numDessin
and YEAR(evaluation.dateEvaluation) = 2024
order by evaluation.note ASC
