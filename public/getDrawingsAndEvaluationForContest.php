<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

require_once "connect.php";

// ensureUserAuthenticated();

if (!isset($_GET['id_contest'])) invalidRequestParams();

/* -------------------------------------------------------------------------- */

// Récupérer les dessins et les évaluations d'un concours donné.

$id_concour = $_GET['id_contest'];

$query = "SELECT * FROM Dessin LEFT JOIN Utilisateur ON Dessin.numCompetiteur = Utilisateur.numUtilisateur WHERE numConcours = $id_concour;";
$data = handleDBSelectRequest($connexion, $query);

// Loop through drawings and add evaluations to each drawing
foreach ($data as $key => $drawing) {
    $id_drawing = $drawing['numDessin'];
    $query = "SELECT dateEvaluation, note, commentaire, numEvaluateur FROM Evaluation WHERE numDessin = $id_drawing;";
    $evaluations = handleDBSelectRequest($connexion, $query);
    $data[$key]['evaluations'] = $evaluations;
}

http_response_code(200);
echo json_encode($data);
exit;
?>