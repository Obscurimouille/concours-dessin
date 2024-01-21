<?php
session_start();

// If the user is not logged in, return an error JSON response
if (!isset($_SESSION['user'])) {
    header('Content-Type: application/json');
    echo json_encode(['error' => 'User not logged in']);
    exit;
}

// Check if the user is an admin
$isAdmin = isset($_SESSION['user']['isAdmin']) ? $_SESSION['user']['isAdmin'] : false;

// Return a JSON response
header('Content-Type: application/json');
echo json_encode(['isAdmin' => $isAdmin]);
exit;

?>