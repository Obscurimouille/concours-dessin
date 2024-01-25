-- en cours
SELECT DISTINCT
	utilisateur.nom,
    utilisateur.prenom,
    (YEAR(CURRENT_DATE)-YEAR(utilisateur.dateDeNaissance)) AS age,
    utilisateur.adresseUtilisateur,
    concours.theme,
    concours.dateDebut,
    concours.dateFin,
    club.nomClub,
    club.departement,
    club.region
from utilisateur,competiteur,concours,participationcompetiteur,club,participationclub
WHERE utilisateur.numUtilisateur=competiteur.numCompetiteur
and utilisateur.numUtilisateur=participationcompetiteur.numCompetiteur
and concours.numConcours=participationcompetiteur.numConcours
and utilisateur.numClub=club.numClub
and club.numClub=participationclub.numClub
and concours.numConcours=participationclub.numConcours