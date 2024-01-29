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

$query = "SELECT 'Evaluateur' AS TypePersonne
            FROM participationevaluateur
            WHERE numEvaluateur = $id_user AND numConcours = $id_concour

            UNION

            SELECT 'Compétiteur' AS TypePersonne
            FROM participationcompetiteur
            WHERE  numCompetiteur = $id_user AND numConcours = $id_concour

            UNION

            SELECT 'Président' AS TypePersonne
            FROM president
            WHERE  numPresident = $id_user AND numConcours = $id_concour";
$data = handleDBSelectRequest($connexion, $query);

http_response_code(200);
if (count($data) == 0) echo json_encode(['TypePersonne' => 'None']);
else echo json_encode($data[0]);
exit;
?>