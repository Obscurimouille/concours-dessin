<?php

function connectDB($adresse, $utilisateur, $motDePasse, $nomDB){
    //connection à la base de donné
    $connexion = new mysqli($adresse, $utilisateur, $motDePasse, $nomDB);
    if ($connexion->connect_error) {
            die("Échec de la connexion à la base de données : " . $connexion->connect_error);
    }
    return $connexion;
}

// Pour les requêtes SELECT
function executerRequeteSelect($connexion, $requete) {
    // Exécution de la requête
    $resultat = $connexion->query($requete);

    // Vérifier si la requête a réussi
    if (!$resultat) {
        die("Échec de la requête : " . $connexion->error);
        $echec = true;
    }
    else {
        $echec = false;
    }

    // Récupérer les données sous forme de tableau associatif
    $donnees = array();
    while ($ligne = $resultat->fetch_assoc()) {
        $donnees[] = $ligne;
    }

    // Libérer la mémoire du résultat
    $resultat->free_result();

      return array('donnees' => $donnees, 'echec' => $echec);
}

//pour les requêtes INSERT, UPDATE, DELETE
function executerRequete($connexion, $requete) {
    // Exécution de la requête
    $resultat = $connexion->query($requete);

    // Vérifier si la requête a réussi
    if (!$resultat) {
        die("Échec de la requête : " . $connexion->error);
        $echec = true;
        }
        else {
        $echec = false;
    }

    // Renvoyer le nombre de lignes affectées (utile pour les requêtes INSERT, UPDATE, DELETE)
    return array('donnees' => $connexion->affected_rows, 'echec' => $echec);
}

//info de connection à la base
$adresse = "localhost";
$utilisateur = "phpmyadmin";
$motDePasse = "PhpMyAdminP5ssword!!";
$nomDB = "concours_dessins";

$connexion = connectDB($adresse, $utilisateur, $motDePasse, $nomDB);
?>