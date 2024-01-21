<?php
session_start();

$isAuthenticated = isset($_SESSION['user']);

header('Content-Type: application/json');

$response = ['isAuthenticated' => $isAuthenticated];

echo json_encode($response);
?>