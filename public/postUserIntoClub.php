<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
$method = 'POST';
ensureRequestMethod($method);

require_once "connect.php";

// ensureUserAuthenticated();

if ( !isset($_POST['id_club']) || !isset($_POST['nom']) || !isset($_POST['prenom']) || !isset($_POST['adresse']) ||
 !isset($_POST['login']) || !isset($_POST['mdp']) || !isset($_POST['dateAdhesion']) || !isset($_POST['dateNaissance'])){
    invalidRequestParams();
}

/* -------------------------------------------------------------------------- */

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
$data = handleDBRequest($connexion, $query);

http_response_code(201);
echo json_encode($data);
exit;
?>