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
            'id' => $i + 1,
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


// Convertir le tableau associatif en JSON et l'afficher
echo json_encode(generateMembers(10));
exit;