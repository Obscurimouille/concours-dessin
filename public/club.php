<?php

header('Content-Type: application/json');

function getClubData($clubId) {
    if ($clubId === '12345') {
        // If it is, return data for that club
        $clubData = [
            'id' => $clubId,
            'name' => 'Club Example',
            'members' => 100,
            'adress' => '123 Example Street',
            'city' => 'Example City',
            'department' => 'Example Department',
            'region' => 'Example Region',
            'phone' => '0123456789',
            'director' => 'John Doe',
        ];
        return $clubData;
    }

    return null;
}

// Check if the club ID is present in the URL
if (isset($_GET['id'])) {
    $clubId = $_GET['id'];
    $clubData = getClubData($clubId);

    // Vérifier si des données ont été récupérées
    if ($clubData) {
        // Convertir le tableau associatif en JSON et l'afficher
        echo json_encode($clubData);
        exit;
    }
}

// Si l'ID du club n'est pas présent ou si aucune donnée n'est trouvée, renvoyer une réponse d'erreur
http_response_code(404);
echo json_encode(['error' => 'Club not found']);