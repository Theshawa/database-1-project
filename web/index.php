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
            <h1>PharmaLink Pharmacy Management</h1>
            <br>
            <br>
            <p class="hint">Select a user to login</p>
            <br>
            <select name="user" id="user">
                <option value="john-admin">John(admin)</option>
                <option value="jake-store_manager">Jake(store manager)</option>
                <option value="jessica-sales_associate">Jessica(sales associate)</option>
                <option value="jonty-pharmacist">Jonty(pharmacist)</option>
            </select><br>
            <button type="submit" name="login">Login</button>
            <div class="owner">
                <span class="dim">Developed by</span>
                <span>Theshawa Dasun</span>
                <span>Nethmi</span>
                <span>Nimal</span>
                <span>Sandaru</span>
                <span>(UCSC Ac. year 20)</span>
                <span class="dim">for</span>
                <span>Project of SCS 1203 - Database 1</span>

            </div>
        </form>
    </main>

</body>

</html>