<?php
session_start();

if (!isset($_SESSION['user'])) {
    header('Location:/index.php');
    return;
}

session_unset();
header('Location:/index.php');

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logging out...</title>
</head>

<body>
    <p>Logging out...</p>
</body>

</html>