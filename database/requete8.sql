
SELECT
utilisateur.nom as 'directeur du club',
club.nomClub,
club.ville,
club.region,
concours.numConcours,
concours.theme
from club,utilisateur,directeur,dirige,concours,participationclub
where club.numClub=dirige.numClub
and directeur.numDirecteur=dirige.numDirecteur
and utilisateur.numUtilisateur=directeur.numDirecteur
and participationclub.numConcours=concours.numConcours
and participationclub.numClub=club.numClub
ORDER BY 'nomClub' ASC