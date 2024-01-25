<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

require_once "connect.php";

// ensureUserAuthenticated();

$query = "SELECT * FROM Concours WHERE etat = 'EN_COURS' LIMIT 1";
$queryResult = executerRequeteSelect($connexion, $query);

$error = $queryResult['echec'];
if ($error) internalServerError();

$data = $queryResult['donnees'];
http_response_code(200);
echo json_encode($data[0]);
exit;