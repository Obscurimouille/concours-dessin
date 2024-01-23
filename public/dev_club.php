<?php

header('Content-Type: application/json');

session_start();
if (!isset($_SESSION['user'])) {
    http_response_code(401);
    echo json_encode(['error' => 'User not logged in']);
    exit;
}

function generateMembers($count) {
    $members = [];

    for ($i = 0; $i < $count; $i++) {
        $member = [
            'firstname' => generateRandomName(),
            'lastname' => generateRandomName(),
            'address' => generateRandomAddress(),
            'username' => generateRandomUsername(),
            'entryDate' => generateRandomDate(),
        ];

        $members[] = $member;
    }

    return $members;
}

function generateRandomName() {
    $names = ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'];
    return $names[array_rand($names)];
}

function generateRandomAddress() {
    return rand(100, 999) . ' Example Street';
}

function generateRandomUsername() {
    return strtolower(generateRandomName()) . '.' . generateRandomName();
}

function generateRandomDate() {
    return date('Y-m-d', rand(strtotime('2010-01-01'), strtotime('2022-12-31')));
}

function getClubData($clubId) {
    if ($clubId === '12345') {
        // If it is, return data for that club
        $clubData = [
            'id' => $clubId,
            'name' => 'Club Example',
            'members' => generateMembers(100),
            'address' => '123 Example Street',
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