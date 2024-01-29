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
$data = handleDBSelectRequest($connexion, $query);

if (!count($data)) {
    header('Location: /login#wrong-credentials');
    exit;
}

$userId = $data[0]['numUtilisateur'];

/* -------------------------------------------------------------------------- */
/*                                    ADMIN                                   */
/* -------------------------------------------------------------------------- */

$query = "SELECT * FROM Administrateur WHERE numAdministrateur = '$userId'";
$adminData = handleDBSelectRequest($connexion, $query);

if (count($adminData)) {
    $_SESSION['user'] = [
        'userId' => $userId,
        'isAdmin' => true,
        'isClubPresident' => false,
    ];

    header('Location: /');
    exit;
}

/* -------------------------------------------------------------------------- */
/*                               CLUB PRESIDENT                               */
/* -------------------------------------------------------------------------- */

$query = "SELECT * FROM Directeur WHERE numDirecteur = '$userId'";
$clubPresidentData = handleDBSelectRequest($connexion, $query);

if (count($clubPresidentData)) {
    $_SESSION['user'] = [
        'userId' => $userId,
        'isAdmin' => false,
        'isClubPresident' => true,
    ];

    header('Location: /');
    exit;
}

/* -------------------------------------------------------------------------- */
/*                                    USER                                    */
/* -------------------------------------------------------------------------- */

$_SESSION['user'] = [
    'userId' => $userId,
    'isAdmin' => false,
    'isClubPresident' => false,
];

header('Location: /');
exit;