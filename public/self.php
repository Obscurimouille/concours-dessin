<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

require_once "connect.php";

ensureUserAuthenticated();

/* -------------------------------------------------------------------------- */

$userId = $_SESSION['user']['userId'];

$query = "SELECT * FROM Utilisateur WHERE numUtilisateur = $userId";
$data = handleDBSelectRequest($connexion, $query);

if (empty($data)){
    http_response_code(404);
    echo json_encode(array("message" => "User not found"));
    exit;
}

http_response_code(200);
echo json_encode($data[0]);