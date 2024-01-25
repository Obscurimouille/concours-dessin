<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

session_start();

/* -------------------------------------------------------------------------- */

$isAuthenticated = isset($_SESSION['user']);

$response = ['isAuthenticated' => $isAuthenticated];

echo json_encode($response);
?>