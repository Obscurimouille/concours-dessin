<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

session_start();

// ensureUserAuthenticated();

/* -------------------------------------------------------------------------- */

// Check if the user is a club president
$isClubPresident = isset($_SESSION['user']['isClubPresident']) ? $_SESSION['user']['isClubPresident'] : false;

// Return a JSON response
echo json_encode(['isClubPresident' => $isClubPresident]);
exit;

?>