<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

require_once "connect.php";

// ensureUserAuthenticated();

/* -------------------------------------------------------------------------- */

if (isset($_GET['managerId'])) {
    $managerId = $_GET['managerId'];
    $query = "SELECT * FROM Club
        JOIN Dirige ON Club.numClub = Dirige.numClub
        WHERE Dirige.numDirecteur = $managerId";
    $data = handleDBSelectRequest($connexion, $query);

    if (empty($data)){
        http_response_code(404);
        echo json_encode(array("message" => "Club not found"));
        exit;
    }

    http_response_code(200);
    echo json_encode($data[0]);
    exit;
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT * FROM Club where numClub = $id";
    $data = handleDBSelectRequest($connexion, $query);

    if (empty($data)){
        http_response_code(404);
        echo json_encode(array("message" => "Club not found"));
        exit;
    }

    http_response_code(200);
    echo json_encode($data[0]);
    exit;
}

$query = "SELECT * FROM Club";
$data = handleDBSelectRequest($connexion, $query);

http_response_code(200);
echo json_encode($data);
exit;
?>