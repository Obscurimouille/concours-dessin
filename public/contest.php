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

$requestParams = $_GET;

if (isset($requestParams['id'])) {
    $query = "SELECT * FROM Concours WHERE numConcours = " . $requestParams['id'];

    if (!isset($requestParams['theme'])) {
        http_response_code(404);
        echo json_encode(['error' => 'Contest not found']);
        exit;
    }
}
else {
    $query = "SELECT * FROM Concours";
}

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







function getContestData($contestId) {

    $stateListe = ['PAS_COMMENCE', 'EN_COURS', 'ATTENTE', 'RESULTAT', 'EVALUE'];

    $dateDebut = new DateTime('2024-01-05');
    $dateFin = new DateTime('2024-02-01');

    if ($contestId === '10') {
        $contestData = [
            'numConcours' => $contestId,
            'theme' => 'Oiseaux',
            'dateDebut' => $dateDebut->format('c'),
            'dateFin' => $dateFin->format('c'),
            'etat' => $stateListe[1],
        ];
        return $contestData;
    }

    return null;
}

// Check if the club ID is present in the URL
if (isset($_GET['id'])) {
    $contestId = $_GET['id'];
    $contestData = getContestData($contestId);

    // Vérifier si des données ont été récupérées
    if ($contestData) {
        // Convertir le tableau associatif en JSON et l'afficher
        echo json_encode($contestData);
        exit;
    }
}

// Si l'ID du club n'est pas présent ou si aucune donnée n'est trouvée, renvoyer une réponse d'erreur
http_response_code(404);
echo json_encode(['error' => 'Club not found']);