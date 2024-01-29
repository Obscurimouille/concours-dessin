<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
$method = 'POST';
ensureRequestMethod($method);

require_once "connect.php";

// ensureUserAuthenticated();

$rawData = file_get_contents('php://input');
$body = json_decode($rawData, true);

if ( !isset($body['evaluatorId']) || !isset($body['drawingId']) || !isset($body['mark']) || !isset($body['comment'])){
    invalidRequestParams();
}

/* -------------------------------------------------------------------------- */

$numEvaluateur = $body['evaluatorId'];
$numDessin = $body['drawingId'];
$note = $body['mark'];
$commentaire = $body['comment'];
$date = date("Y-m-d");

// ALTER TABLE `utilisateur` CHANGE `numUtilisateur` `numUtilisateur` INT(11) NOT NULL AUTO_INCREMENT;
$query = "INSERT INTO Evaluation (dateEvaluation, note, commentaire, numEvaluateur, numDessin)
    VALUES ('$date', $note, '$commentaire', '$numEvaluateur', '$numDessin'); ";
$data = handleDBRequest($connexion, $query);

http_response_code(201);
echo json_encode($data);
exit;
?>