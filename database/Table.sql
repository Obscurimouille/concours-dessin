DROP TABLE IF EXISTS Evaluation;
DROP TABLE IF EXISTS ParticipationEvaluateur;
DROP TABLE IF EXISTS ParticipationCompétiteur;
DROP TABLE IF EXISTS ParticipationClub;
DROP TABLE IF EXISTS Dirige;    
DROP TABLE IF EXISTS Dessin;
DROP TABLE IF EXISTS Utilisateur;
DROP TABLE IF EXISTS Club;
DROP TABLE IF EXISTS Concours;
DROP TABLE IF EXISTS Directeur;
DROP TABLE IF EXISTS Administrateur;
DROP TABLE IF EXISTS Compétiteur;
DROP TABLE IF EXISTS Evaluateur;
DROP TABLE IF EXISTS Président;




CREATE TABLE Président (
    numPrésident INT PRIMARY KEY,
    prime DECIMAL(10, 2)
);

CREATE TABLE Evaluateur (
    numEvaluateur INT PRIMARY KEY,
    specialite VARCHAR(255)
);


CREATE TABLE Compétiteur (
    numCompetiteur INT PRIMARY KEY,
    datePremParticipation DATE
);

CREATE TABLE Administrateur (
    numAdministrateur INT PRIMARY KEY,
    dateDebut DATE
);

CREATE TABLE Directeur (
    numDirecteur INT PRIMARY KEY,
    dateDebut DATE
);


CREATE TABLE Concours (
    numConcours INT PRIMARY KEY,
    theme VARCHAR(255),
    dateDebut DATE,
    dateFin DATE,
    etat ENUM('pas commencé', 'en cours', 'attente', 'résultat', 'évalué')
);


CREATE TABLE Club (
    numClub INT PRIMARY KEY,
    numDirecteur INT,
    nomClub VARCHAR(255),
    adresse VARCHAR(255),
    numTelephone VARCHAR(20),
    nombreAdherents INT,
    ville VARCHAR(255),
    departement VARCHAR(255),
    region VARCHAR(255),
    FOREIGN KEY (numDirecteur) REFERENCES Directeur(numDirecteur)
);

CREATE TABLE Utilisateur (
    numUtilisateur INT PRIMARY KEY,
    numClub INT,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    adresse VARCHAR(255),
    login VARCHAR(255),
    motDePasse VARCHAR(255),
    dateDebut DATE,
    FOREIGN KEY (numClub) REFERENCES Club(numClub)
);

CREATE TABLE Dessin (
    numDessin INT PRIMARY KEY,
    numCompetiteur INT,
    commentaire TEXT,
    classement INT,
    dateRemise DATE,
    leDessin BLOB,
    FOREIGN KEY (numCompetiteur) REFERENCES Compétiteur(numCompetiteur)
);

CREATE TABLE Dirige (
    numClub INT,
    numDirecteur INT,
    PRIMARY KEY (numClub, numDirecteur),
    FOREIGN KEY (numClub) REFERENCES Club(numClub),
    FOREIGN KEY (numDirecteur) REFERENCES Directeur(numDirecteur)
);

CREATE TABLE ParticipationClub (
    numClub INT,
    numConcours INT,
    PRIMARY KEY (numClub, numConcours),
    FOREIGN KEY (numClub) REFERENCES Club(numClub),
    FOREIGN KEY (numConcours) REFERENCES Concours(numConcours)
);

CREATE TABLE ParticipationCompétiteur (
    numCompetiteur INT,
    numConcours INT,
    PRIMARY KEY (numCompetiteur, numConcours),
    FOREIGN KEY (numCompetiteur) REFERENCES Compétiteur(numCompetiteur),
    FOREIGN KEY (numConcours) REFERENCES Concours(numConcours)
);

CREATE TABLE ParticipationEvaluateur (
    numCompetiteur INT,
    numEvaluateur INT,
    PRIMARY KEY (numCompetiteur, numEvaluateur),
    FOREIGN KEY (numCompetiteur) REFERENCES Compétiteur(numCompetiteur),
    FOREIGN KEY (numEvaluateur) REFERENCES Evaluateur(numEvaluateur)
);

CREATE TABLE Evaluation (
    numEvaluateur1 INT,
    numEvaluateur2 INT,
    numDessin INT,
    dateEvaluation DATE,
    note DECIMAL(5, 2),
    commentaire TEXT,
    PRIMARY KEY (numEvaluateur1, numEvaluateur2, numDessin),
    FOREIGN KEY (numEvaluateur1) REFERENCES Evaluateur(numEvaluateur),
    FOREIGN KEY (numEvaluateur2) REFERENCES Evaluateur(numEvaluateur),
    FOREIGN KEY (numDessin) REFERENCES Dessin(numDessin)
);