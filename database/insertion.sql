-- Insert data into Evaluateur
INSERT INTO Evaluateur (numEvaluateur, specialite) VALUES
(1, 'Portrait Artist'),
(2, 'Landscape Artist'),
(3, 'Abstract Art Specialist');

-- Insert data into Competiteur
INSERT INTO Competiteur (numCompetiteur, datePremParticipation) VALUES
(101, '2023-05-15'),
(102, '2022-08-20'),
(103, '2024-01-10');

-- Insert data into Directeur
INSERT INTO Directeur (numDirecteur, dateDebut) VALUES
(201, '2021-03-01'),
(202, '2022-01-15'),
(203, '2023-07-05');

-- Insert data into Concours
INSERT INTO Concours (numConcours, theme, dateDebut, dateFin, etat) VALUES
(301, 'Nature in Art', '2023-06-10', '2023-06-15', 'en cours'),
(302, 'Abstract Expressionism', '2022-11-05', '2022-11-10', 'résultat'),
(303, 'Portraits of the Future', '2024-03-20', '2024-03-25', 'attente');

-- Insert data into Club
INSERT INTO Club (numDirecteur, nomClub, adresse, numTelephone, nombreAdherents, ville, departement, region) VALUES
(201, 'Art Enthusiasts Club', '123 Main St', '123-456-7890', 50, 'Cityville', 'Artland', 'Creative Region'),
(202, 'Palette Express', '456 Art Avenue', '987-654-3210', 30, 'Paint City', 'Artland', 'Creative Region'),
(203, 'Canvas Creators', '789 Brush St', '555-123-4567', 40, 'Artopia', 'Artland', 'Creative Region');

-- Insert data into Utilisateur
INSERT INTO Utilisateur (numClub, nom, prenom, adresse, login, motDePasse, dateDebut) VALUES
(1, 'John Doe', 'Jane', '456 Easel Blvd', 'john_doe', 'password123', '2021-02-10'),
(2, 'Alice Artist', 'Bob', '789 Canvas St', 'alice_artist', 'art123', '2022-05-20'),
(3, 'Eva Expressionist', 'Eric', '321 Brush Ave', 'eva_expressionist', 'painter456', '2023-10-01');

-- Insert data into Administrateur
INSERT INTO Administrateur (numAdministrateur, dateDebut) VALUES
(1, '2021-02-10'),
(2, '2022-05-20'),
(3, '2023-10-01');

-- Insert data into President
INSERT INTO President (numPresident, prime) VALUES
(1, 'Best Artist Award'),
(2, 'Masterpiece Recognition'),
(3, 'Creative Innovation Prize');

-- Insert data into Dessin
INSERT INTO Dessin (numDessin, numCompetiteur, commentaire, classement, dateRemise, leDessin) VALUES
(401, 101, 'Beautiful portrait', 1, '2023-06-12', '0x0101010101'),
(402, 102, 'Surreal landscape', 2, '2022-11-08', '0x0202020202'),
(403, 103, 'Abstract masterpiece', 3, '2024-03-23', '0x0303030303');

-- Insert data into Dirige
INSERT INTO Dirige (numClub, numDirecteur) VALUES
(1, 201),
(2, 202),
(3, 203);

-- Insert data into ParticipationClub
INSERT INTO ParticipationClub (numClub, numConcours) VALUES
(1, 301),
(2, 302),
(3, 303);

-- Insert data into ParticipationCompetiteur
INSERT INTO ParticipationCompetiteur (numCompetiteur, numConcours) VALUES
(101, 301),
(102, 302),
(103, 303);

-- Insert data into ParticipationEvaluateur
INSERT INTO ParticipationEvaluateur (numCompetiteur, numEvaluateur) VALUES
(101, 1),
(102, 2),
(103, 3);

-- Insert data into Evaluation
INSERT INTO Evaluation (numEvaluateur1, numEvaluateur2, numDessin, dateEvaluation, note, commentaire) VALUES
(1, 2, 401, '2023-06-13', 9.5, 'Excellent work'),
(2, 3, 402, '2022-11-09', 8.0, 'Impressive creativity'),
(3, 1, 403, '2024-03-25', 9.2, 'Innovative abstraction');
