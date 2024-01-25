<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

session_start();

// ensureUserAuthenticated();

/* -------------------------------------------------------------------------- */

// Check if the user is an admin
$isAdmin = isset($_SESSION['user']['isAdmin']) ? $_SESSION['user']['isAdmin'] : false;

// Return a JSON response
echo json_encode(['isAdmin' => $isAdmin]);
exit;

?>