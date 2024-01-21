<?php
session_start();

// Accept only POST requests
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $username = $_POST['username'];
    $password = $_POST['password'];

    /* -------------------------------------------------------------------------- */
    /*                                    ADMIN                                   */
    /* -------------------------------------------------------------------------- */
    if ($username === 'admin' && $password === 'admin123') {
        $_SESSION['user'] = [
            'username' => $username,
            'isAdmin' => true,
            'isClubPresident' => false,
        ];

        header('Location: /');
        exit;
    }

    /* -------------------------------------------------------------------------- */
    /*                               CLUB PRESIDENT                               */
    /* -------------------------------------------------------------------------- */
    if ($username === 'president' && $password === 'president123') {
        $_SESSION['user'] = [
            'username' => $username,
            'isAdmin' => false,
            'isClubPresident' => true,
        ];

        header('Location: /');
        exit;
    }

    /* -------------------------------------------------------------------------- */
    /*                                    USER                                    */
    /* -------------------------------------------------------------------------- */
    if ($username === 'user' && $password === 'user123') {
        $_SESSION['user'] = [
            'username' => $username,
            'isAdmin' => false,
            'isClubPresident' => false,
        ];

        header('Location: /');
        exit;
    }

    /* -------------------------------------------------------------------------- */
    /*                              WRONG CREDENTIALS                             */
    /* -------------------------------------------------------------------------- */
    header('Location: /login');
    exit;

}