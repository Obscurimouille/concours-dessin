-- Insert data into Club table
INSERT INTO Club (numClub, nomClub, adresseClub, numTelephone, nombreAdherents, ville, departement, region)
VALUES
    (1, 'Bretonart', '1 rue de la republique', '0299205868', 24, 'RENNES', 'Ille-et-Vilaine', 'Bretagne'),
    (2, 'MARTLO', '2 rue de rennes', '0299324932', 20, 'SAINT-MALO', 'Ille-et-Vilaine', 'Bretagne'),
    (3, 'MARTLO',  '34 rue du port', '0299324910', 20, 'BREST', 'Finistere', 'Bretagne'),
    (4, 'MARTLO', '4 avenue du lac', '0299322345', 20, 'QUIMPER', 'Finistere', 'Bretagne'),
    (5, 'ARTGERS', '3 rue du maine', '0299322223', 20, 'ANGERS', 'Maine-et-Loire', 'PAYS DE LA LOIRE'),
    (6, 'CHOLART', '3 rue de Angers', '0299322222', 20, 'CHOLET', 'Maine-et-Loire', 'PAYS DE LA LOIRE'),
    (7, 'NARTO', '9 avenue de la liberter', '0299322111', 20, 'NANTES', 'Loire-Atlantique', 'PAYS DE LA LOIRE'),
    (8, 'NAZAIRART', '3 route du port', '0299325654', 20, 'SAINT-NAZAIRE', 'Loire-Atlantique', 'PAYS DE LA LOIRE');
    

-- Insert data into Concours table
INSERT INTO Concours (numConcours, theme, dateDebut, dateFin, etat)
VALUES
    (1, 'Drawing Contest 2024', '2024-01-03', '2024-01-30', 'EN_COURS'),
    (2, 'Art Show 2023', '2023-07-01', '2023-07-30', 'EVALUE'),
    (3, 'Painting Contest 2023', '2023-04-01', '2023-04-15', 'EVALUE'),
    (4, 'Art Show 2023', '2023-01-01', '2023-01-15', 'EVALUE'),
    (5, 'Drawing Contest 2023', '2023-10-01', '2022-10-15', 'EVALUE'),
    (6, 'Art Show 2022', '2022-07-01', '2022-07-15', 'EVALUE'),
    (7, 'Painting Contest 2022', '2022-04-01', '2022-04-15', 'EVALUE'),
    (8, 'Art Show 2022', '2022-02-01', '2022-02-15', 'EVALUE'),
    (9, 'Drawing Contest 2022', '2022-10-01', '2020-10-15', 'EVALUE');
    

-- Insert data into Utilisateur table (common for Competiteur, Evaluateur, President, Administrateur)
INSERT INTO Utilisateur (numUtilisateur, nom, prenom, adresseUtilisateur, login, motDePasse, dateAdhesion, numClub, dateDeNaissance)
VALUES
    (100,'Chuck', 'Norris','1 rue Jesus','chuck_norris','dieu111','2020-01-02',1,'1980-02-01'),
    (101, 'Wick', 'John', '789 Pine St', 'wick_john', 'password223', '2022-01-03', 1, '1990-05-15'),
    (109, 'Jane', 'Smith', '987 Elm St', 'jane_smith', 'pass456', '2022-02-01', 1, '1985-08-20'),
    (110, 'Bob', 'Jones', '123 Oak St', 'bob_jones', 'pass789', '2022-03-01', 1, '1995-01-25'),
    (111, 'Mary', 'Johnson', '456 Maple St', 'mary_johnson', 'pass101112', '2022-04-01', 1, '1992-12-10'),
    (112, 'James', 'Williams', '654 Birch St', 'james_williams', 'pass131415', '2022-05-01', 1, '1991-03-05'),
    (113, 'Patricia', 'Brown', '321 Cedar St', 'patricia_brown', 'pass161718', '2022-06-01', 1, '1993-06-30'),
    (114, 'Michael', 'Miller', '789 Pine St', 'michael_miller', 'pass192021', '2022-07-01', 1, '1994-09-15'),
    (115, 'Linda', 'Davis', '987 Elm St', 'linda_davis', 'pass222324', '2022-08-01', 1, '1996-02-20'),
    (116, 'William', 'Garcia', '123 Oak St', 'william_garcia', 'pass252627', '2022-09-01', 1, '1997-07-25'),
    (117, 'Barbara', 'Rodriguez', '456 Maple St', 'barbara_rodriguez', 'pass282930', '2022-10-01', 1, '1998-10-10'),
    (118, 'David', 'Wilson', '654 Birch St', 'david_wilson', 'pass313233', '2022-11-01', 1, '1999-11-05'),
    (119, 'Elizabeth', 'Martinez', '321 Cedar St', 'elizabeth_martinez', 'pass343536', '2022-12-01', 1, '2000-04-30'),
    (120, 'Richard', 'Anderson', '789 Pine St', 'richard_anderson', 'pass373839', '2023-01-01', 1, '2001-01-15'),
    (121, 'Jennifer', 'Taylor', '987 Elm St', 'jennifer_taylor', 'pass404142', '2023-02-01', 1, '2002-08-20'),
    (122, 'Charles', 'Thomas', '123 Oak St', 'charles_thomas', 'pass434445', '2023-03-01', 1, '2003-05-25'),
    (123, 'Maria', 'Hernandez', '456 Maple St', 'maria_hernandez', 'pass464748', '2023-04-01', 1, '2004-12-10'),
    (124, 'Joseph', 'Moore', '654 Birch St', 'joseph_moore', 'pass495051', '2023-05-01', 1, '2005-03-05'),
    (125, 'Susan', 'Martin', '321 Cedar St', 'susan_martin', 'pass525354', '2023-06-01', 1, '2006-06-30'),
    (126, 'Thomas', 'Jackson', '789 Pine St', 'thomas_jackson', 'pass555657', '2023-07-01', 1, '2007-09-15'),
    (127, 'Margaret', 'Thompson', '987 Elm St', 'margaret_thompson', 'pass585960', '2023-08-01', 1, '2008-12-20'),
    (128, 'Christopher', 'White', '123 Oak St', 'christopher_white', 'pass616263', '2023-09-01', 1, '2009-07-25'),
    (129, 'Dorothy', 'Lopez', '456 Maple St', 'dorothy_lopez', 'pass646566', '2023-10-01', 1, '2010-10-10'),
    (130, 'Daniel', 'Lee', '654 Birch St', 'daniel_lee', 'pass676869', '2023-11-01', 1, '2011-11-05'),
    (131, 'Karen', 'Gonzalez', '321 Cedar St', 'karen_gonzalez', 'pass707172', '2023-04-12',1,'2000-22-04'),

    (102, 'Parker', 'Peter', '789 Pine St', 'Parker_Peter', 'pass737475', '2023-05-12', 2, '1995-02-30'),
    (133, 'Matthew', 'Clark', '987 Elm St', 'matthew_clark', 'pass767778', '2023-06-12', 2, '2013-03-15'),
    (134, 'Nancy', 'Lewis', '123 Oak St', 'nancy_lewis', 'pass798081', '2023-07-12', 2, '2014-06-30'),
    (135, 'Anthony', 'Robinson', '456 Maple St', 'anthony_robinson', 'pass828384', '2023-08-12', 2, '2015-09-15'),
    (136, 'Deborah', 'Walker', '654 Birch St', 'deborah_walker', 'pass858687', '2023-09-12', 2, '2016-12-20'),
    (137, 'Charles', 'Perez', '321 Cedar St', 'charles_perez', 'pass888990', '2023-10-12', 2, '2017-07-25'),
    (138, 'Betty', 'Hall', '789 Pine St', 'betty_hall', 'pass919293', '2023-11-12', 2, '2018-10-10'),
    (139, 'Billy', 'Hall', '789 Pine St', 'billy_hall', 'pass919211', '2023-11-12', 2, '2001-10-10'),
    (140, 'Martin', 'Lea', '12 Rue de la Marine', 'martin_lea', 'pass123', '2022-04-01', 2, '1995-06-10'),
    (141, 'Dubois', 'Hugo', '8 Rue Saint-Vincent', 'dubois_hugo', 'pass456', '2022-04-02', 2, '1990-08-15'),
    (142, 'Lefevre', 'Emma', '25 Quai Duguay-Trouin', 'lefevre_emma', 'pass789', '2022-04-03', 2, '1987-12-20'),
    (143, 'Leroy', 'Nathan', '18 Rue de Dinan', 'leroy_nathan', 'passabc', '2022-04-04', 2, '1985-04-25'),
    (144, 'Morel', 'Eva', '5 Rue de la Vieille Boucherie', 'morel_eva', 'passxyz', '2022-04-05', 2, '1998-02-18'),
    (145, 'Simon', 'Noemie', '7 Rue Saint-Malo', 'simon_noemie', 'pass789', '2022-04-06', 2, '1993-09-22'),
    (146, 'Roux', 'Leo', '32 Rue de la Crosse', 'roux_leo', 'passdef', '2022-04-07', 2, '1989-11-30'),
    (147, 'Fournier', 'Zoe', '14 Rue Saint-Thomas', 'fournier_zoe', 'pass456', '2022-04-08', 2, '1996-07-12'),
    (148, 'Leroux', 'Louis', '22 Rue Sainte-Barbe', 'leroux_louis', 'pass123', '2022-04-09', 2, '1994-03-28'),
    (149, 'Thomas', 'Manon', '9 Rue Saint-Jean', 'thomas_manon', 'passabc', '2022-04-10', 2, '1991-05-14'),
    (150, 'Moreau', 'Arthur', '3 Rue Porcon de la Barbinais', 'moreau_arthur', 'passxyz', '2022-04-11', 2, '1988-10-08'),
    (151, 'Girard', 'Lola', '17 Rue des Marins', 'girard_lola', 'pass789', '2022-04-12', 2, '1997-04-16'),
    (152, 'Andre', 'Lucas', '20 Quai Saint-Louis', 'andre_lucas', 'passdef', '2022-04-13', 2, '1992-01-19'),
    (153, 'Lemoine', 'Ines', '2 Rue des Cordiers', 'lemoine_ines', 'pass456', '2022-04-14', 2, '1986-08-23'),
    (154, 'Brun', 'Ethan', '11 Rue des Terreaux', 'brun_ethan', 'pass123', '2022-04-15', 2, '1999-07-30'),
    (155, 'Rolland', 'Clara', '15 Rue de la Vieille Boucherie', 'rolland_clara', 'passabc', '2022-04-16', 2, '1994-02-02'),
    (156, 'Renard', 'Tom', '27 Rue Sainte-Barbe', 'renard_tom', 'passxyz', '2022-04-17', 2, '1991-09-06'),
    (157, 'Langlois', 'Leila', '1 Rue de Dinan', 'langlois_leila', 'pass789', '2022-04-18', 2, '1988-12-11'),
    (158, 'Michel', 'Antoine', '4 Rue Saint-Thomas', 'michel_antoine', 'passdef', '2022-04-19', 2, '1997-05-18'),
    (159, 'Guillot', 'Liam', '10 Rue Porcon de la Barbinais', 'guillot_liam', 'pass456', '2022-04-20', 2, '1992-02-21'),

    (103,'Billy','Leroux','12 Rue de la Marine','billy_leroux','pass123','2022-04-01',3,'1995-06-10'),
    (160, 'Lopez', 'Emma', '12 Rue de Siam', 'lopez_emma', 'pass123', '2022-04-01', 3, '1995-06-10'),
    (161, 'Martin', 'Hugo', '8 Rue de la Porte', 'martin_hugo', 'pass456', '2022-04-02', 3, '1990-08-15'),
    (162, 'Roussel', 'Noah', '25 Quai de la Douane', 'roussel_noah', 'pass789', '2022-04-03', 3, '1987-12-20'),
    (163, 'Lefevre', 'Eva', '18 Rue Kerguelen', 'lefevre_eva', 'passabc', '2022-04-04', 3, '1985-04-25'),
    (164, 'Dupont', 'Leo', '5 Rue de la Marine Nationale', 'dupont_leo', 'passxyz', '2022-04-05', 3, '1998-02-18'),
    (165, 'Leclerc', 'Zoe', '7 Rue de la Porte Guillaume', 'leclerc_zoe', 'pass789', '2022-04-06', 3, '1993-09-22'),
    (166, 'Bertrand', 'Lucas', '32 Quai de la Douane', 'bertrand_lucas', 'passdef', '2022-04-07', 3, '1989-11-30'),
    (167, 'Lemoine', 'Lola', '14 Rue Yves Collet', 'lemoine_lola', 'pass456', '2022-04-08', 3, '1996-07-12'),
    (168, 'Dumont', 'Louis', '22 Rue de la Porte', 'dumont_louis', 'pass123', '2022-04-09', 3, '1994-03-28'),
    (169, 'Leroux', 'Manon', '9 Quai Commandant Malbert', 'leroux_manon', 'passabc', '2022-04-10', 3, '1991-05-14'),
    (170, 'Leduc', 'Arthur', '3 Rue du Chateau', 'leduc_arthur', 'passxyz', '2022-04-11', 3, '1988-10-08'),
    (171, 'Roux', 'Lola', '17 Rue du Port', 'roux_lola', 'pass789', '2022-04-12', 3, '1997-04-16'),
    (172, 'Andre', 'Lucas', '20 Quai du Commandant Malbert', 'andre_lucas', 'passdef', '2022-04-13', 3, '1992-01-19'),
    (173, 'Leclerc', 'Ines', '2 Rue de Eglise', 'leclerc_ines', 'pass456', '2022-04-14', 3, '1986-08-23'),
    (174, 'Brun', 'Ethan', '11 Quai Duguay-Trouin', 'brun_ethan', 'pass123', '2022-04-15', 3, '1999-07-30'),
    (175, 'Renard', 'Clara', '15 Rue de la Porte Guillaume', 'renard_clara', 'passabc', '2022-04-16', 3, '1994-02-02'),
    (176, 'Michel', 'Tom', '27 Quai Duguay-Trouin', 'michel_tom', 'passxyz', '2022-04-17', 3, '1991-09-06'),
    (177, 'Leroy', 'Leila', '1 Rue du Chateau', 'leroy_leila', 'pass789', '2022-04-18', 3, '1988-12-11'),
    (178, 'Guillot', 'Antoine', '4 Rue de l Eglise', 'guillot_antoine', 'passdef', '2022-04-19', 3, '1997-05-18'),
    (179, 'Thomas', 'Liam', '10 Rue Yves Collet', 'thomas_liam', 'pass456', '2022-04-20', 3, '1992-02-21'),

    (104, 'Bertrand', 'Max','1 Rue de la Muro','bertrand_max','pass123','1999-04-01',4,'1990-07-10'),
    (180, 'Lefevre', 'Liam', '12 Rue de la Marine Nationale', 'lefevre_liam', 'pass123', '2022-04-01', 4, '1995-06-10'),
    (181, 'Girard', 'Zoe', '8 Rue Saint-Vincent', 'girard_zoe', 'pass456', '2022-04-02', 4, '1990-08-15'),
    (182, 'Thomas', 'Arthur', '25 Quai Duguay-Trouin', 'thomas_arthur', 'pass789', '2022-04-03', 4, '1987-12-20'),
    (183, 'Michel', 'Manon', '18 Rue de Dinan', 'michel_manon', 'passabc', '2022-04-04', 4, '1985-04-25'),
    (184, 'Dupuis', 'Eva', '5 Rue de la Vieille Boucherie', 'dupuis_eva', 'passxyz', '2022-04-05', 4, '1998-02-18'),
    (185, 'Moreau', 'Tom', '7 Rue Saint-Malo', 'moreau_tom', 'pass789', '2022-04-06', 4, '1993-09-22'),
    (186, 'Leroy', 'Lea', '32 Rue de la Crosse', 'leroy_lea', 'passdef', '2022-04-07', 4, '1989-11-30'),
    (187, 'Fournier', 'Hugo', '14 Rue Saint-Thomas', 'fournier_hugo', 'pass456', '2022-04-08', 4, '1996-07-12'),
    (188, 'Brun', 'Louis', '22 Rue Sainte-Barbe', 'brun_louis', 'pass123', '2022-04-09', 4, '1994-03-28'),
    (189, 'Lemoine', 'Emma', '9 Rue Saint-Jean', 'lemoine_emma', 'passabc', '2022-04-10', 4, '1991-05-14'),
    (190, 'Roux', 'Ethan', '3 Rue Porcon de la Barbinais', 'roux_ethan', 'passxyz', '2022-04-11', 4, '1988-10-08'),
    (191, 'Leduc', 'Ines', '17 Rue des Marins', 'leduc_ines', 'pass789', '2022-04-12', 4, '1997-04-16'),
    (192, 'Giraud', 'Leo', '20 Quai Saint-Louis', 'giraud_leo', 'passdef', '2022-04-13', 4, '1992-01-19'),
    (193, 'Roussel', 'Clara', '2 Rue des Cordiers', 'roussel_clara', 'pass456', '2022-04-14', 4, '1986-08-23'),
    (194, 'Leclerc', 'Noemie', '11 Rue des Terreaux', 'leclerc_noemie', 'pass123', '2022-04-15', 4, '1999-07-30'),
    (195, 'Renard', 'Lucas', '15 Rue de la Vieille Boucherie', 'renard_lucas', 'passabc', '2022-04-16', 4, '1994-02-02'),
    (196, 'Andre', 'Leila', '27 Rue Sainte-Barbe', 'andre_leila', 'passxyz', '2022-04-17', 4, '1991-09-06'),
    (197, 'Leroux', 'Antoine', '1 Rue de Dinan', 'leroux_antoine', 'pass789', '2022-04-18', 4, '1988-12-11'),
    (198, 'Guillot', 'Eva', '4 Rue Saint-Thomas', 'guillot_eva', 'passdef', '2022-04-19', 4, '1997-05-18'),
    (199, 'Martin', 'Noah', '10 Rue Porcon de la Barbinais', 'martin_noah', 'pass456', '2022-04-20', 4, '1992-02-21'),

    (105, 'Wayne', 'Bruce','23 rue de la justice', 'wayne_bruce','pass121','2013-12-1',5,'1990-04-11'),
    (200, 'Giraud', 'Hugo', '15 Rue de la Liberté', 'giraud_hugo', 'pass123', '2022-04-01', 5, '1995-06-10'),
    (201, 'Leclerc', 'Emma', '28 Rue Kerguelen', 'leclerc_emma', 'pass456', '2022-04-02', 5, '1990-08-15'),
    (202, 'Roux', 'Liam', '7 Rue du Port', 'roux_liam', 'pass789', '2022-04-03', 5, '1987-12-20'),
    (203, 'Moreau', 'Zoe', '32 Rue de Siam', 'moreau_zoe', 'pass123', '2022-04-01', 5, '1995-06-10'),
    (204, 'Roussel', 'Ethan', '18 Rue Saint-Malo', 'roussel_ethan', 'pass456', '2022-04-02', 5, '1990-08-15'),
    (205, 'Lemoine', 'Manon', '22 Rue du Chateau', 'lemoine_manon', 'pass789', '2022-04-03', 5, '1987-12-20'),
    (206, 'Brun', 'Noah', '5 Rue de Dinan', 'brun_noah', 'pass123', '2022-04-01', 5, '1995-06-10'),
    (207, 'Leroux', 'Clara', '15 Rue de la Vieille Boucherie', 'leroux_clara', 'pass456', '2022-04-02', 5, '1990-08-15'),
    (208, 'Fournier', 'Lucas', '21 Quai Saint-Louis', 'fournier_lucas', 'pass789', '2022-04-03', 5, '1987-12-20'),
    (209, 'Girard', 'Lea', '9 Rue Saint-Jean', 'girard_lea', 'pass123', '2022-04-01', 5, '1995-06-10'),
    (210, 'Thomas', 'Arthur', '3 Rue Porcon de la Barbinais', 'thomas_arthur', 'pass456', '2022-04-02', 5, '1990-08-15'),
    (211, 'Michel', 'Zoe', '17 Rue des Marins', 'michel_zoe', 'pass789', '2022-04-03', 5, '1987-12-20'),
    (212, 'Dupont', 'Noemie', '20 Quai du Commandant Malbert', 'dupont_noemie', 'pass123', '2022-04-01', 5, '1995-06-10'),
    (213, 'Lefevre', 'Lola', '27 Rue Sainte-Barbe', 'lefevre_lola', 'pass456', '2022-04-02', 5, '1990-08-15'),
    (214, 'Leroy', 'Antoine', '1 Rue de Dinan', 'leroy_antoine', 'pass789', '2022-04-03', 5, '1987-12-20'),
    (215, 'Morel', 'Eva', '14 Rue Saint-Thomas', 'morel_eva', 'pass123', '2022-04-01', 5, '1995-06-10'),
    (216, 'Andre', 'Lucas', '12 Quai Duguay-Trouin', 'andre_lucas', 'pass456', '2022-04-02', 5, '1990-08-15'),
    (217, 'Roux', 'Manon', '2 Rue des Cordiers', 'roux_manon', 'pass789', '2022-04-03', 5, '1987-12-20'),
    (218, 'Roussel', 'Ethan', '11 Rue des Terreaux', 'roussel_ethan', 'pass123', '2022-04-01', 5, '1995-06-10'),
    (219, 'Lemoine', 'Ines', '23 Quai Saint-Louis', 'lemoine_ines', 'pass456', '2022-04-02', 5, '1990-08-15'),
    (220, 'Brun', 'Tom', '8 Rue de la Vieille Boucherie', 'brun_tom', 'pass789', '2022-04-03', 5, '1987-12-20'),

    (106,'Martin','Lea','12 Rue de la Marine','martin_lea','pass120','2010-04-01',6,'1995-06-10'),
    (221, 'Martin', 'Lola', '12 Rue de Siam', 'martin_lola', 'pass123', '2022-04-01', 6, '1995-06-10'),
    (222, 'Leclerc', 'Antoine', '18 Rue Saint-Malo', 'leclerc_antoine', 'pass456', '2022-04-02', 6, '1990-08-15'),
    (223, 'Roux', 'Eva', '22 Rue du Chateau', 'roux_eva', 'pass789', '2022-04-03', 6, '1987-12-20'),
    (224, 'Moreau', 'Lucas', '5 Rue de Dinan', 'moreau_lucas', 'pass123', '2022-04-01', 6, '1995-06-10'),
    (225, 'Roussel', 'Noemie', '15 Rue de la Vieille Boucherie', 'roussel_noemie', 'pass456', '2022-04-02', 6, '1990-08-15'),
    (226, 'Lemoine', 'Manon', '27 Rue Sainte-Barbe', 'lemoine_manon', 'pass789', '2022-04-03', 6, '1987-12-20'),
    (227, 'Brun', 'Hugo', '14 Rue Saint-Thomas', 'brun_hugo', 'pass123', '2022-04-01', 6, '1995-06-10'),
    (228, 'Leroux', 'Zoe', '1 Rue de Dinan', 'leroux_zoe', 'pass456', '2022-04-02', 6, '1990-08-15'),
    (229, 'Fournier', 'Ethan', '9 Rue Saint-Jean', 'fournier_ethan', 'pass789', '2022-04-03', 6, '1987-12-20'),
    (230, 'Girard', 'Emma', '3 Rue Porcon de la Barbinais', 'girard_emma', 'pass123', '2022-04-01', 6, '1995-06-10'),
    (231, 'Thomas', 'Liam', '17 Rue des Marins', 'thomas_liam', 'pass456', '2022-04-02', 6, '1990-08-15'),
    (232, 'Michel', 'Lea', '20 Quai Saint-Louis', 'michel_lea', 'pass789', '2022-04-03', 6, '1987-12-20'),
    (233, 'Dupont', 'Noah', '2 Rue des Cordiers', 'dupont_noah', 'pass123', '2022-04-01', 6, '1995-06-10'),
    (234, 'Lefevre', 'Lola', '11 Rue des Terreaux', 'lefevre_lola', 'pass456', '2022-04-02', 6, '1990-08-15'),
    (235, 'Leroy', 'Manon', '23 Quai Saint-Louis', 'leroy_manon', 'pass789', '2022-04-03', 6, '1987-12-20'),
    (236, 'Morel', 'Lucas', '8 Rue de la Vieille Boucherie', 'morel_lucas', 'pass123', '2022-04-01', 6, '1995-06-10'),
    (237, 'Andre', 'Eva', '12 Rue de Siam', 'andre_eva', 'pass456', '2022-04-02', 6, '1990-08-15'),
    (238, 'Roux', 'Antoine', '18 Rue Saint-Malo', 'roux_antoine', 'pass789', '2022-04-03', 6, '1987-12-20'),
    (239, 'Roussel', 'Ines', '22 Rue du Chateau', 'roussel_ines', 'pass123', '2022-04-01', 6, '1995-06-10'),
    (240, 'Lemoine', 'Tom', '5 Rue de Dinan', 'lemoine_tom', 'pass456', '2022-04-02', 6, '1990-08-15'),

    (107,'Starlord','Peter','12 Rue des etoiles','starlord_peter','pass160','2022-04-01',7,'1993-06-11'),
    (241, 'Giraud', 'Hugo', '15 Rue de la Liberté', 'giraud_hugo', 'pass123', '2022-04-01', 7, '1995-06-10'),
    (242, 'Leclerc', 'Emma', '28 Rue Kerguelen', 'leclerc_emma', 'pass456', '2022-04-02', 7, '1990-08-15'),
    (243, 'Roux', 'Liam', '7 Rue du Port', 'roux_liam', 'pass789', '2022-04-03', 7, '1987-12-20'),
    (244, 'Moreau', 'Zoe', '32 Rue de Siam', 'moreau_zoe', 'passabc', '2022-04-04', 7, '1985-04-25'),
    (245, 'Lemoine', 'Manon', '22 Rue du Chateau', 'lemoine_manon', 'passxyz', '2022-04-05', 7, '1998-02-18'),
    (246, 'Roussel', 'Ethan', '18 Rue Saint-Malo', 'roussel_ethan', 'pass789', '2022-04-06', 7, '1993-09-22'),
    (247, 'Leroux', 'Lea', '32 Rue de la Crosse', 'leroux_lea', 'passdef', '2022-04-07', 7, '1989-11-30'),
    (248, 'Fournier', 'Hugo', '14 Rue Saint-Thomas', 'fournier_hugo', 'pass456', '2022-04-08', 7, '1996-07-12'),
    (249, 'Brun', 'Louis', '22 Rue Sainte-Barbe', 'brun_louis', 'pass123', '2022-04-09', 7, '1994-03-28'),
    (250, 'Lemoine', 'Emma', '9 Rue Saint-Jean', 'lemoine_emma', 'passabc', '2022-04-10', 7, '1991-05-14'),
    (251, 'Roux', 'Ethan', '3 Rue Porcon de la Barbinais', 'roux_ethan', 'passxyz', '2022-04-11', 7, '1988-10-08'),
    (252, 'Leduc', 'Ines', '17 Rue des Marins', 'leduc_ines', 'pass789', '2022-04-12', 7, '1997-04-16'),
    (253, 'Giraud', 'Leo', '20 Quai Saint-Louis', 'giraud_leo', 'passdef', '2022-04-13', 7, '1992-01-19'),
    (254, 'Roussel', 'Clara', '2 Rue des Cordiers', 'roussel_clara', 'pass456', '2022-04-14', 7, '1986-08-23'),
    (255, 'Leclerc', 'Noemie', '11 Rue des Terreaux', 'leclerc_noemie', 'pass123', '2022-04-15', 7, '1999-07-30'),
    (256, 'Renard', 'Lucas', '15 Rue de la Vieille Boucherie', 'renard_lucas', 'passabc', '2022-04-16', 7, '1994-02-02'),
    (257, 'Andre', 'Leila', '27 Rue Sainte-Barbe', 'andre_leila', 'passxyz', '2022-04-17', 7, '1991-09-06'),
    (258, 'Leroux', 'Antoine', '1 Rue de Dinan', 'leroux_antoine', 'pass789', '2022-04-18', 7, '1988-12-11'),
    (259, 'Guillot', 'Eva', '4 Rue Saint-Thomas', 'guillot_eva', 'passdef', '2022-04-19', 7, '1997-05-18'),
    (260, 'Martin', 'Noah', '10 Rue Porcon de la Barbinais', 'martin_noah', 'pass456', '2022-04-20', 7, '1992-02-21'),

    (108,'Lee','Stan','12 Rue de Marvel','lee_stan','pass173','2022-04-11',8,'1980-06-10'),
    (261, 'Giraud', 'Hugo', '15 Rue de la Liberté', 'giraud_hugo', 'pass123', '2022-04-01', 8, '1995-06-10'),
    (262, 'Leclerc', 'Emma', '28 Rue Kerguelen', 'leclerc_emma', 'pass456', '2022-04-02', 8, '1990-08-15'),
    (263, 'Roux', 'Liam', '7 Rue du Port', 'roux_liam', 'pass789', '2022-04-03', 8, '1987-12-20'),
    (264, 'Moreau', 'Zoe', '32 Rue de Siam', 'moreau_zoe', 'passabc', '2022-04-04', 8, '1985-04-25'),
    (265, 'Lemoine', 'Manon', '22 Rue du Chateau', 'lemoine_manon', 'passxyz', '2022-04-05', 8, '1998-02-18'),
    (266, 'Roussel', 'Ethan', '18 Rue Saint-Malo', 'roussel_ethan', 'pass789', '2022-04-06', 8, '1993-09-22'),
    (267, 'Leroux', 'Lea', '32 Rue de la Crosse', 'leroux_lea', 'passdef', '2022-04-07', 8, '1989-11-30'),
    (268, 'Fournier', 'Hugo', '14 Rue Saint-Thomas', 'fournier_hugo', 'pass456', '2022-04-08', 8, '1996-07-12'),
    (269, 'Brun', 'Louis', '22 Rue Sainte-Barbe', 'brun_louis', 'pass123', '2022-04-09', 8, '1994-03-28'),
    (270, 'Lemoine', 'Emma', '9 Rue Saint-Jean', 'lemoine_emma', 'passabc', '2022-04-10', 8, '1991-05-14'),
    (271, 'Roux', 'Ethan', '3 Rue Porcon de la Barbinais', 'roux_ethan', 'passxyz', '2022-04-11', 8, '1988-10-08'),
    (272, 'Leduc', 'Ines', '17 Rue des Marins', 'leduc_ines', 'pass789', '2022-04-12', 8, '1997-04-16'),
    (273, 'Giraud', 'Leo', '20 Quai Saint-Louis', 'giraud_leo', 'passdef', '2022-04-13', 8, '1992-01-19'),
    (274, 'Roussel', 'Clara', '2 Rue des Cordiers', 'roussel_clara', 'pass456', '2022-04-14', 8, '1986-08-23'),
    (275, 'Leclerc', 'Noemie', '11 Rue des Terreaux', 'leclerc_noemie', 'pass123', '2022-04-15', 8, '1999-07-30'),
    (276, 'Renard', 'Lucas', '15 Rue de la Vieille Boucherie', 'renard_lucas', 'passabc', '2022-04-16', 8, '1994-02-02'),
    (277, 'Andre', 'Leila', '27 Rue Sainte-Barbe', 'andre_leila', 'passxyz', '2022-04-17', 8, '1991-09-06'),
    (278, 'Leroux', 'Antoine', '1 Rue de Dinan', 'leroux_antoine', 'pass789', '2022-04-18', 8, '1988-12-11'),
    (279, 'Guillot', 'Eva', '4 Rue Saint-Thomas', 'guillot_eva', 'passdef', '2022-04-19', 8, '1997-05-18'),
    (280, 'Martin', 'Noah', '10 Rue Porcon de la Barbinais', 'martin_noah', 'pass456', '2022-04-20', 8, '1992-02-21');



INSERT INTO Directeur (numDirecteur, dateDebut)
VALUES
    (101, '2023-01-01'),
    (102, '2024-01-02'),
    (103, '2023-04-12'),
    (104, '2000-04-12'),
    (105, '2016-04-12'),
    (106, '2020-04-12'),
    (107, '2023-04-12'),
    (108, '2023-04-12');

-- Insert data into Dirige table
INSERT INTO Dirige (numClub, numDirecteur)
VALUES
    (1, 101),
    (2, 102),
    (3, 103),
    (4, 104),
    (5, 105),
    (6, 106),
    (7, 107),
    (8, 108);

-- Insert data into Administrateur table
INSERT INTO Administrateur (numAdministrateur, dateDebut)
VALUES
    (100, '2022-01-01');
    

-- Insert data into Evaluateur table
INSERT INTO Evaluateur (numEvaluateur, specialite)
VALUES

    (109, 'Portrait'),
    (110, 'Landscape'),
    (111, 'Portrait'),

    (133, 'Landscape'),
    (134, 'Portrait'),
    (135, 'Landscape'),

    (160, 'Portrait'),
    (161, 'Landscape'),
    (162, 'Portrait'),

    (180, 'Landscape'),
    (181, 'Portrait'),
    (182, 'Landscape'),

    (200, 'Portrait'),
    (201, 'Landscape'),
    (202, 'Portrait'),
  
    (221, 'Landscape'),
    (222, 'Portrait'),
    (223, 'Landscape'),
  
    (241, 'Portrait'),
    (242, 'Landscape'),
    (243, 'Portrait'),
    
    (261, 'Landscape'),
    (262, 'Portrait'),
    (263, 'Landscape');

-- Insert data into Competiteur table
INSERT INTO Competiteur (numCompetiteur, datePremiereParticipation)
VALUES
    
    (120, '2023-07-01'),
    (121, '2023-07-01'),
    (122, '2023-07-01'),
    (123, '2023-07-01'),
    (124, '2023-07-01'),
    (125, '2023-07-01'),

    
    
    (140,'2023-07-01'),
    (141,'2023-07-01'),
    (142,'2023-07-01'),
    (143,'2023-07-01'),
    (144,'2023-07-01'),
    (145,'2023-07-01'),
    
   
    (170,'2023-07-01'),
    (171,'2023-07-01'),
    (172,'2023-07-01'),
    (173,'2023-07-01'),
    (174,'2023-07-01'),
    (175,'2023-07-01'),
    
    (190,'2023-07-01'),
    (191,'2023-07-01'),
    (192,'2023-07-01'),
    (193,'2023-07-01'),
    (194,'2023-07-01'),
    (195,'2023-07-01'),
    
    (210,'2023-07-01'),
    (211,'2023-07-01'),
    (212,'2023-07-01'),
    (213,'2023-07-01'),
    (214,'2023-07-01'),
    (215,'2023-07-01'),
   
    (230,'2023-07-01'),
    (231,'2023-07-01'),
    (232,'2023-07-01'),
    (233,'2023-07-01'),
    (234,'2023-07-01'),
    (235,'2023-07-01'),
    
    (250,'2023-07-01'),
    (251,'2023-07-01'),
    (252,'2023-07-01'),
    (253,'2023-07-01'),
    (254,'2023-07-01'),
    (255,'2023-07-01'),
    
    (270,'2023-07-01'),
    (271,'2023-07-01'),
    (272,'2023-07-01'),
    (273,'2023-07-01'),
    (274,'2023-07-01'),
    (275,'2023-07-01');  

-- Insert data into President table
INSERT INTO President (numPresident, prime, numConcours)
VALUES
    (126, 500.00, 1);
 

-- Insert data into Dessin table
INSERT INTO Dessin (numDessin, commentaire, classement, dateRemise, leDessin, numCompetiteur, numConcours)
VALUES
    (1, 'Beautiful artwork', 1, '2023-07-01', 'drawing1.svg', 121, 2),
    (2, 'Amazing creativity', 2, '2023-07-05', 'drawing2.svg', 122, 2),
    (3, 'Art of style',3,'2023-07-09','art_of_style.svg',123,2),
    (4, 'Art proto',4,'2023-07-09','art_proto.svg',124,2),
    (5, 'batman',5,'2023-07-09','batman.svg',125,2),
    (6, 'art play',6,'2023-07-10','art_play.svg',140,2),
    (7, 'Art of duty',7,'2023-07-10','art_of_duty.svg',121,2),
    (8, 'peanut',8,'2023-07-11','peanut.svg',122,2),
    (9, 'joker',9,'2023-07-11','draw_joker.svg',123,2),
    (10, 'playplay',10,'2023-07-12','proto_playplay.svg',230,2),
    (11, 'style',11,'2023-07-13','style.svg',231,2),
    (12, 'Art of ',12,'2023-07-13','art_of.svg',270,2),
    (13, 'poule',13,'2023-07-13','poule.svg',190,2),
    (14, 'crepe',14,'2023-07-14','crepe_draw.svg',230,2),
    (15, 'yodamaster',15,'2023-07-15','yodamaster.svg',215,2),
    (16, 'vador sama',16,'2023-07-16','vador_sama.svg',250,2),
    (17, 'fufu',17,'2023-07-17','fufu.svg',253,2),
    (18, 'licorne',18,'2023-07-17','licorne.svg',253,2),
    (19, 'tutu',19,'2023-07-18','tutu.svg',214,2),
    (20, 'blop',20,'2023-07-19','blop.svg',233,2),
    (21, 'mustorc',21,'2023-07-20','orc_draw.svg',123,2);
    

-- Insert data into ParticipationCompetiteur table
INSERT INTO ParticipationCompetiteur (numConcours, numCompetiteur)
VALUES
    (2, 120),
    (2, 121),
    (2, 122),
    (2, 123),
    (2, 124),
    (2, 125),
    (2, 140),
    (2, 141),
    (2, 142),
    (2, 143),
    (2, 144),
    (2, 145),
    (2, 170),
    (2, 171),
    (2, 172),
    (2, 173),
    (2, 174),
    (2, 175),
    (2, 190),
    (2, 191),
    (2, 192),
    (2, 193),
    (2, 194),
    (2, 195),
    (2, 210),
    (2, 211),
    (2, 212),
    (2, 213),
    (2, 214),
    (2, 215),
    (2, 230),
    (2, 231),
    (2, 232),
    (2, 233),
    (2, 234),
    (2, 235),
    (2, 250),
    (2, 251),
    (2, 252),
    (2, 253),
    (2, 254),
    (2, 255),
    (2, 270),
    (2, 271),
    (2, 272),
    (2, 273),
    (2, 274),
    (2, 275);
    

-- Insert data into ParticipationEvaluateur table
INSERT INTO ParticipationEvaluateur (numConcours, numEvaluateur)
VALUES
    (2, 109),
    (2, 110),
    (2, 111),
    (2, 133),
    (2, 134),
    (2, 135),
    (2, 160),
    (2, 161),
    (2, 162),
    (2, 180),
    (2, 181),
    (2, 182),
    (2, 200),
    (2, 201),
    (2, 202),
    (2, 221),
    (2, 222),
    (2, 223),
    (2, 241),
    (2, 242),
    (2, 243),
    (2, 261),
    (2, 262),
    (2, 263);

-- Insert data into ParticipationClub table
INSERT INTO ParticipationClub (numConcours, numClub)
VALUES
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (2, 7),
    (2, 8);
    

-- Insert data into Evaluation table
INSERT INTO Evaluation (numEvaluation, dateEvaluation, note, commentaire, numEvaluateur, numDessin)
VALUES
    (1, '2024-01-05', 9.5, 'Excellent work', 201, 1),
    (2, '2024-01-06', 8.7, 'Impressive creativity', 241, 1),

    (3, '2024-01-07',7.2,'good',133,2),
    (4, '2024-01-08',8.2,'good job',160,2),

    (5, '2024-01-09',5.2,'cool',221,3),
    (6, '2024-01-10',4.2,'euhhhh',261,3),

    (7, '2024-01-11',3.2,'Loose',180,4),
    (8, '2024-01-12',2.2,'pfff',200,4),

    (9, '2024-01-13',1.2,'Beurk',242,5),
    (10, '2024-01-14',0.2,'nop',261,5),
    
    (11, '2024-01-15',9.2,'Very good',263,6),
    (12, '2024-01-16',8.2,'good art',182,6);

  
    
