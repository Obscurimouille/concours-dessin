<?php

header("Content-Type: application/json");
require_once "connect.php";

// session_start();
// if (!isset($_SESSION['user'])) {
//     http_response_code(401);
//     echo json_encode(['error' => 'User not logged in']);
//     exit;
// }

if ($_SERVER['REQUEST_METHOD'] === 'GET') {

    $id_user = $_GET['id_user'];
    $id_concour = $_GET['id_concour'];

    $query = "SELECT 'Evaluateur' AS TypePersonne
              FROM participationevaluateur
              WHERE numEvaluateur = $id_user AND numConcours = $id_concour

              UNION

              SELECT 'Compétiteur' AS TypePersonne
              FROM participationcompetiteur
              WHERE  numCompetieur = $id_user AND numConcours = $id_concour

              UNION

              SELECT 'Président' AS TypePersonne
              FROM president
              WHERE  numPresident = $id_user AND numConcours = $id_concour";
    $resultat_query = executerRequeteSelect($connexion,$query);
    $data = $resultat_query['donnees'];
    $echec = $resultat_query['echec'];
    if ($echec) {
        http_response_code(500);
        echo json_encode(['error' => 'Internal Server Error']);
        exit;
    } else {
        http_response_code(200);
        echo json_encode($data);
        exit;
    }
}

?>