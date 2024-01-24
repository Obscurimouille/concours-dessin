<?php

header('Content-Type: application/json');
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

$query = "SELECT * FROM Concours WHERE etat = 'EN_COURS' LIMIT 1";

$queryResult = executerRequeteSelect($connexion, $query);
$failed = $queryResult['echec'];

if ($failed) {
    http_response_code(500);
    echo json_encode(['error' => 'Internal Server Error']);
    exit;
}

$data = $queryResult['donnees'];
http_response_code(200);
echo json_encode($data);
exit;