SELECT 
    utilisateur.nom,
    utilisateur.prenom,
    concours.etat AS 'etat du concours',
    (YEAR(CURRENT_DATE) - YEAR(utilisateur.dateDeNaissance)) AS 'age'
FROM competiteur,utilisateur,concours,participationcompetiteur
where competiteur.numCompetiteur=utilisateur.numUtilisateur
and (concours.etat='RESULTAT' or concours.etat='EVALUE')
and participationcompetiteur.numConcours=concours.numConcours
and participationcompetiteur.numCompetiteur=competiteur.numCompetiteur