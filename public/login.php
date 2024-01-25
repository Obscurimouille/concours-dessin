<?php
header("Content-Type: application/json");

require_once "requestUtils.php";
// Allow only POST requests
ensureRequestMethod('POST');

require_once "connect.php";

session_start();

if (!isset($_POST['username']) || !isset($_POST['password'])) invalidRequestParams();

/* -------------------------------------------------------------------------- */

$username = $_POST['username'];
$password = $_POST['password'];

$query = "SELECT numUtilisateur, nom, prenom FROM Utilisateur WHERE login = '$username' AND motDePasse = '$password'";
$queryResult = executerRequeteSelect($connexion, $query);

$error = $queryResult['echec'];
if ($error) internalServerError();

$data = $queryResult['donnees'];

if (!count($data)) {
    header('Location: /login#wrong-credentials');
    exit;
}

$userId = $data[0]['numUtilisateur'];

// echo json_encode($data);
// exit;

$query = "SELECT * FROM Administrateur WHERE numAdministrateur = '$userId'";
$isAdminQueryResult = executerRequeteSelect($connexion, $query);

$error = $isAdminQueryResult['echec'];
if ($error) internalServerError();

$adminData = $isAdminQueryResult['donnees'];

/* -------------------------------------------------------------------------- */
/*                                    ADMIN                                   */
/* -------------------------------------------------------------------------- */
if (count($adminData)) {
    echo 'admin';
    $_SESSION['user'] = [
        'userId' => $userId,
        'isAdmin' => true,
        'isClubPresident' => false,
    ];

    // header('Location: /');
    exit;
}

$query = "SELECT * FROM Directeur WHERE numDirecteur = '$userId'";
$isClubPresidentQueryResult = executerRequeteSelect($connexion, $query);

$error = $isClubPresidentQueryResult['echec'];
if ($error) internalServerError();

$clubPresidentData = $isClubPresidentQueryResult['donnees'];

/* -------------------------------------------------------------------------- */
/*                               CLUB PRESIDENT                               */
/* -------------------------------------------------------------------------- */
if (count($clubPresidentData)) {
    echo 'president';
    $_SESSION['user'] = [
        'userId' => $userId,
        'isAdmin' => false,
        'isClubPresident' => true,
    ];

    // header('Location: /');
    exit;
}


/* -------------------------------------------------------------------------- */
/*                                    USER                                    */
/* -------------------------------------------------------------------------- */
$_SESSION['user'] = [
    'username' => $username,
    'isAdmin' => false,
    'isClubPresident' => false,
];

header('Location: /');
exit;