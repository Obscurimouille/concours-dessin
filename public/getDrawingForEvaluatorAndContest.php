<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only GET requests
ensureRequestMethod('GET');

require_once "connect.php";

// ensureUserAuthenticated();

if (!isset($_GET['id_user']) || !isset($_GET['id_contest'])) invalidRequestParams();

/* -------------------------------------------------------------------------- */

$onlyNotEvaluated = isset($_GET['onlyNotEvaluated']) ? $_GET['onlyNotEvaluated'] : false;

// Récupérer les dessins qu'un évaluateur doit évaluer pour un concours donné.

$id_user = $_GET['id_user'];
$id_concour = $_GET['id_contest'];

if ($onlyNotEvaluated) {
    $query = "SELECT Dessin.* FROM Dessin
        JOIN Jury ON Dessin.numDessin = Jury.numDessin
        WHERE (Jury.numEvaluateur1 = $id_user OR Jury.numEvaluateur2 = $id_user)
            AND Dessin.numConcours = $id_concour
            AND NOT EXISTS (
                SELECT 1
                FROM Evaluation
                WHERE Evaluation.numDessin = Dessin.numDessin AND Evaluation.numEvaluateur = $id_user
        );";
}
else {
    $query = "SELECT Dessin.* FROM Dessin
        JOIN Jury ON Dessin.numDessin = Jury.numDessin
        WHERE Jury.numEvaluateur1 = $id_user OR Jury.numEvaluateur2 = $id_user
        AND Dessin.numConcours = $id_concour;";
}

$data = handleDBSelectRequest($connexion, $query);

http_response_code(200);
echo json_encode($data);
exit;
?>