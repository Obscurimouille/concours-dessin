<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

session_start();

/* -------------------------------------------------------------------------- */

session_destroy();

header("Location: /login");
exit();

?>