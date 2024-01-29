<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
$method = 'POST';
ensureRequestMethod($method);

require_once "connect.php";

// ensureUserAuthenticated();

if (!isset($_POST['theme']) || !isset( $_POST['date_debut']) || !isset( $_POST['date_fin']) || !isset( $_POST['etat'])){
    invalidRequestParams();
}

/* -------------------------------------------------------------------------- */

$theme = $_POST['theme'];
$date_debut = $_POST['date_debut'];
$date_fin = $_POST['date_fin'];
$etat = $_POST['etat'];

// ALTER TABLE `concours` CHANGE `numConcours` `numConcours` INT(11) NOT NULL AUTO_INCREMENT;
$query = "INSERT INTO concours (theme, dateDebut, dateFin, etat)
VALUES ('$theme', '$date_debut', '$date_fin', '$etat'); ";
$data = handleDBRequest($connexion, $query);

http_response_code(201);
echo json_encode($data);
exit;
?>