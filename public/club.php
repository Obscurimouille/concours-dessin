<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

require_once "connect.php";

// ensureUserAuthenticated();

/* -------------------------------------------------------------------------- */

if (isset($_GET['id'])){
    $query = "SELECT * FROM club where numClub = " . $_GET['id'];
    $queryResult = executerRequeteSelect($connexion,$query);
    $data = $queryResult['donnees'];

    $error = $queryResult['echec'];
    if ($error) internalServerError();

    http_response_code(200);
    echo json_encode($data);
    exit;
}

$queryResult = executerRequeteSelect($connexion, "SELECT * FROM Club");
$data = $queryResult['donnees'];

$error = $queryResult['echec'];
if ($error) internalServerError();

http_response_code(200);
echo json_encode($data);
exit;
?>