# Schéma Logique
Utilisateur (<u>numUtilisateur</u>, numClub*, nom, prénom, adresse, login, motDePasse, dateDébut, dateDeNaissance) 

Club(<u>numClub</u>, nomClub, adresse, numTéléphone, nombre Adhérents, ville, département, région)

Président (<u>numPresident*</u>, <u>numConcours*</u>, dateDebut, prime)

Evaluateur (<u>numEvaluateur*</u>, specialite)  

Evaluation(<u>numEvaluateur*</u>, <u>numDessin*</u>, dateEvaluation, note, commentaire )

Compétiteur (<u>numCompetiteur*</u>, datePremParticipation)

Administrateur (<u>numAdministrateur*</u>, dateDébut)

Directeur (<u>numDirecteur*</u>, <u>numConcours*</u>, dateDébut)

Dirige (<u>numClub*</u>, <u>numDirecteur*</u>) → (Cas particulier 1X1, la création de la table Dirige est adéquate)

Dessin(<u>numDessin</u>, numCompetiteur*, commentaire, classement, dateRemise, leDessin)

Concours(<u>numConcours</u> ,thème, dateDebut, dateFin, etat: enum= 'pas commmencé', 'en cours', 'attente', 'résultat', 'évalué')

ParticipationClub(<u>numClub*</u>, <u>numConcours*</u>)

ParticipationCompétiteur(<u>numCompetiteur*</u>, <u>numConcours*</u>)

ParticipationEvaluateur(<u>numCompetiteur*</u>, <u>numEvaluateur*</u>)

Jury(<u>numJury</u>, numDessin*, numEvaluateur1*, numEvaluateur2*)