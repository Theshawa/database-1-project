<?php

session_start();

if (isset($_SESSION['user'])) {
    header('Location:/dashboard.php');
}


if (isset($_POST['login'])) {
    $sections = explode("-", $_POST["user"]);
    $_SESSION['user'] =  $sections[0];
    $_SESSION['user_role'] =  $sections[1];
    header('Location:/dashboard.php');
}


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Login | PharmaLink</title>
</head>

<body>
    <main>
        <form class="login" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <h1>Login</h1>
            <br>
            <select name="user" id="user">
                <option value="john-admin">John(admin)</option>
                <option value="jake-store_manager">Jake(store manager)</option>
                <option value="jessica-sales_associate">Jessica(sales associate)</option>
                <option value="jonty-pharmacist">Jonty(pharmacist)</option>
            </select><br>
            <button type="submit" name="login">Login</button>
        </form>
    </main>
</body>

</html>