<?php

header("Content-Type: application/json");
require_once "connect.php";
require_once "resquestUtils.php";

// ensureUserAuthenticated();

$method = 'POST';
ensureRequestMethod($method);

if ( !isset($_POST['id_club']) || !isset($_POST['nom']) || !isset($_POST['prenom']) || !isset($_POST['adresse']) ||
 !isset($_POST['login']) || !isset($_POST['mdp']) || !isset($_POST['dateAdhesion']) || !isset($_POST['dateNaissance'])){
    invalidRequestParams();
}


// $body = json_decode(file_get_contents('php://input'), true);
$id_club = $_POST['id_club'];
$nom = $_POST['nom'];
$prenom = $_POST['prenom'];
$adresse = $_POST['adresse'];
$login = $_POST['login'];
$mdp = $_POST['mdp'];
$dateAdhesion = $_POST['dateAdhesion'];
$dateNaissance = $_POST['dateNaissance'];

// $id_club = intval($id_club);
// $dateAdhesion = strval($dateAdhesion);
// $dateNaissance = strval($dateNaissance);

$query = "INSERT INTO Utilisateur (nom, prenom, adresseUtilisateur, login, motDePasse, dateAdhesion, numClub, dateDeNaissance)
VALUES ('$nom', '$prenom', '$adresse', '$login', '$mdp', '$dateAdhesion', $id_club, '$dateNaissance'); ";
$resultat_query = executerRequete($connexion,$query);
$data = $resultat_query['donnees'];
$echec = $resultat_query['echec'];

if ($echec) {
    internalServerError();
}
http_response_code(201);
echo json_encode($data);
exit;
?>