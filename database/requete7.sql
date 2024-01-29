-- nombre de competiteurs dans les concours finis
SELECT
	count(competiteur.numCompetiteur) AS NOMBRE_DE_COMPETITEUR,
    concours.numConcours,
    concours.theme,
    concours.etat
FROM competiteur,concours,participationcompetiteur
WHERE participationcompetiteur.numConcours=concours.numConcours
and participationcompetiteur.numCompetiteur=competiteur.numCompetiteur
and concours.etat='EVALUE' or concours.etat='RESULTAT'
GROUP by concours.numConcours
ORDER by NOMBRE_DE_COMPETITEUR