<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

require_once "connect.php";

// ensureUserAuthenticated();

if (!isset($_GET['id_user']) || !isset($_GET['id_contest'])) invalidRequestParams();

/* -------------------------------------------------------------------------- */

$id_user = $_GET['id_user'];
$id_concour = $_GET['id_contest'];

$query = "SELECT * FROM dessin WHERE numCompetiteur = $id_user AND numConcours = $id_concour";
$queryResult = executerRequeteSelect($connexion,$query);
$data = $queryResult['donnees'];

$error = $queryResult['echec'];
if ($error) internalServerError();

http_response_code(200);
echo json_encode($data);
exit;
?>