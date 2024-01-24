<?php

header("Content-Type: application/json");
require_once "connect.php";

// session_start();
// if (!isset($_SESSION['user'])) {
//     http_response_code(401);
//     echo json_encode(['error' => 'User not logged in']);
//     exit;
// }


if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    http_response_code(405);
    echo json_encode(['error' => 'Invalid request method']);
    exit;
}

if (isset($_GET['id'])){
    $query = "SELECT * FROM club where numClub = " . $_GET['id'];
    $resultat_query = executerRequeteSelect($connexion,$query);
    $data = $resultat_query['donnees'];
    $echec = $resultat_query['echec'];

    if ($echec) {
        http_response_code(500);
        echo json_encode(['error' => 'Internal Server Error']);
        exit;
    }
    http_response_code(200);
    echo json_encode($data);
    exit;
}

$query = "SELECT * FROM Club";
$resultat_query = executerRequeteSelect($connexion,$query);
$data = $resultat_query['donnees'];
$echec = $resultat_query['echec'];

if ($echec) {
    http_response_code(500);
    echo json_encode(['error' => 'Internal Server Error']);
    exit;
}
http_response_code(200);
echo json_encode($data);
exit;

http_response_code(400);
echo json_encode(['error' => 'Invalid request parameters']);
?>