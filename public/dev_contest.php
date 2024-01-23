<?php

header('Content-Type: application/json');

session_start();
if (!isset($_SESSION['user'])) {
    http_response_code(401);
    echo json_encode(['error' => 'User not logged in']);
    exit;
}

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