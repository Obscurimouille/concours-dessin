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

if (!isset($_GET['id_user']) || !isset($_GET['id_contest'])) {
    http_response_code(400);
    echo json_encode(['error' => 'Invalid request parameters']);
    exit;
}

$id_user = $_GET['id_user'];
$id_concour = $_GET['id_contest'];

$query = "SELECT * FROM dessin WHERE numConcours =$id_concour
AND numDessin = (SELECT numDessin FROM evaluation WHERE numEvaluateur = $id_user); ";
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
?>