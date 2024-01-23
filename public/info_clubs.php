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

    $request = $_GET['request'];
    $reponse = [];

    if ($request == "all"){
        $query = "SELECT club.numClub,club.nomClub,club.adresse,club.adresse,
        club.ville,club.numTelephone,club.nombreAdherents from club";
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
    if ($request == "one"){
        $id = $_GET['id'];
        $query = "SELECT club.numClub,club.nomClub,club.adresse,club.adresse,
        club.ville,club.numTelephone,club.nombreAdherents from club where numClub= $id";
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
}
?>