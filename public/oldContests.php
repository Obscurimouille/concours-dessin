<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

require_once "connect.php";

// ensureUserAuthenticated();

/* -------------------------------------------------------------------------- */

$query = "SELECT * FROM Concours WHERE etat <> 'EN_COURS' AND etat <> 'PAS_COMMENCE' ORDER BY dateFin DESC";
$data = handleDBSelectRequest($connexion, $query);

http_response_code(200);
echo json_encode($data);
exit;