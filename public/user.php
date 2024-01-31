<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

require_once "connect.php";

// ensureUserAuthenticated();

/* -------------------------------------------------------------------------- */

if (isset($_GET['id'])){
    $query = "SELECT * FROM `Utilisateur` WHERE `numUtilisateur` = " . $_GET['id'];
    $data = handleDBSelectRequest($connexion, $query);

    http_response_code(200);
    echo json_encode($data);
    exit;
}

$query = "SELECT * FROM `Utilisateur`";
$data = handleDBSelectRequest($connexion, $query);

http_response_code(200);
echo json_encode($data);
exit;
?>