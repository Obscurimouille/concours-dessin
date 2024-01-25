<?php
function ensureRequestMethod($method) {
    if ($_SERVER['REQUEST_METHOD'] !== $method) {
        http_response_code(405);
        echo json_encode(['error' => 'Invalid request method']);
        exit;
    }
}

function ensureUserAuthenticated() {
    session_start();
    if (!isset($_SESSION['user'])) {
        http_response_code(401);
        echo json_encode(['error' => 'User not logged in']);
        exit;
    }
}

function internalServerError() {
    http_response_code(500);
    echo json_encode(['error' => 'Internal Server Error']);
    exit;
}

function invalidRequestParams() {
    http_response_code(400);
    echo json_encode(['error' => 'Invalid request parameters']);
    exit;
}

function handleDBRequest($connection, $query) {
    $queryResult = executerRequeteSelect($connexion, $query);
    if ($queryResult['echec']) internalServerError();
    return $queryResult['donnees'];
}