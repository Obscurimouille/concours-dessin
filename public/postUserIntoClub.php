<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
$method = 'POST';
ensureRequestMethod($method);

require_once "connect.php";

// ensureUserAuthenticated();

if ( !isset($_POST['clubId']) || !isset($_POST['lastname']) || !isset($_POST['firstname']) ||
 !isset($_POST['address']) || !isset($_POST['birthDate'])){
    invalidRequestParams();
}

/* -------------------------------------------------------------------------- */

$id_club = $_POST['clubId'];
$nom = $_POST['lastname'];
$prenom = $_POST['firstname'];
$adresse = $_POST['address'];
$login = $nom . $prenom;
$mdp = $nom . $prenom;
$dateAdhesion = date("Y-m-d");
$dateNaissance = $_POST['birthDate'];

$query = "INSERT INTO Utilisateur (nom, prenom, adresseUtilisateur, login, motDePasse, dateAdhesion, numClub, dateDeNaissance)
VALUES ('$nom', '$prenom', '$adresse', '$login', '$mdp', '$dateAdhesion', $id_club, '$dateNaissance'); ";
$data = handleDBRequest($connexion, $query);

header('Location: /');
exit;
?>