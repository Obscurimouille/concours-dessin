<?php
// This would be your framework default bootstrap file

// During dev, this file would be hit when accessing your local host, like:
// http://vite-php-setup.test

require_once __DIR__ . '/helpers.php';

?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Zaiten</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/x-icon" href="<?= assetUrl('images/logos/favicon-32.png') ?>">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&amp;display=swap" rel="stylesheet">
        <?= vite('main.js') ?>
    </head>
    <body class="vue-app">
        <app-header></app-header>
        <main>
            <h1 data-i18n="title"></h1>
        </main>
    </body>
</html>