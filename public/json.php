<?php

    header('Content-Type: application/json');

    $jsonData = [
        'message' => 'Ceci est un exemple de données JSON depuis json.php',
        'timestamp' => time(),
    ];

    // Convertir le tableau associatif en JSON et l'afficher
    echo json_encode($jsonData);

?>