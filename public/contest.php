<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

require_once "connect.php";

// ensureUserAuthenticated();

/* -------------------------------------------------------------------------- */

$requestParams = $_GET;
if (isset($requestParams['id'])) {
    $query = "SELECT * FROM Concours WHERE numConcours = " . $requestParams['id'];
    $queryResult = executerRequeteSelect($connexion, $query);

    $error = $queryResult['echec'];
    if ($error) internalServerError();

    $data = $queryResult['donnees'];

    if (!count($data)) {
        http_response_code(404);
        echo json_encode(['error' => 'Contest not found']);
        exit;
    }

    http_response_code(200);
    echo json_encode($data[0]);
    exit;
}

$query = "SELECT * FROM Concours";
$queryResult = executerRequeteSelect($connexion, $query);

$error = $queryResult['echec'];
if ($error) internalServerError();

$data = $queryResult['donnees'];
http_response_code(200);
echo json_encode($data);
exit;