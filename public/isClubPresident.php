<?php
session_start();

// If the user is not logged in, return an error JSON response
if (!isset($_SESSION['user'])) {
    header('Content-Type: application/json');
    echo json_encode(['error' => 'User not logged in']);
    exit;
}

// Check if the user is a club president
$isClubPresident = isset($_SESSION['user']['isClubPresident']) ? $_SESSION['user']['isClubPresident'] : false;

// Return a JSON response
header('Content-Type: application/json');
echo json_encode(['isClubPresident' => $isClubPresident]);
exit;

?>