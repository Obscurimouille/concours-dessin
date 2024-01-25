<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

require_once "connect.php";

// ensureUserAuthenticated();

/* -------------------------------------------------------------------------- */

if (isset($_GET['id'])){
    $query = "SELECT * FROM `utilisateur` WHERE `numUtilisateur` = " . $_GET['id'];
    $queryResult = executerRequeteSelect($connexion,$query);
    $data = $queryResult['donnees'];

    $error = $queryResult['echec'];
    if ($error) internalServerError();

    http_response_code(200);
    echo json_encode($data);
    exit;
}

$query = "SELECT * FROM `utilisateur`";
$queryResult = executerRequeteSelect($connexion,$query);
$data = $queryResult['donnees'];

$error = $queryResult['echec'];
if ($error) internalServerError();

http_response_code(200);
echo json_encode($data);
exit;
?>