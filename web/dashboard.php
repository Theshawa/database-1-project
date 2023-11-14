<?php
require "./queries.php";

session_start();

$username = $_SESSION["user"];
$role = $_SESSION["user_role"];

$queries = [];

switch ($role) {
    case 'admin':
        $queries = $admin_queries;
        break;
    case 'store_manager':
        $queries = $store_manager_queries;
        break;
    case 'sales_associate':
        $queries = $sales_associate_queries;
        break;
    case 'pharmacist':
        $queries = $pharmacist_queries;
        break;
}


$result = null;
$last_ran = null;


if (isset($_POST['execute'])) {
    $query = $queries[$_POST['execute']];
    $last_ran = $query['t'];

    try {
        $conn = new mysqli("localhost", $username, $username . '123', "pharmalink");
        $res = $conn->query($query['q']);
        if (str_contains($query['q'], 'SELECT') && !str_contains($query['q'], 'INSERT')) {
            $rows = array();
            while ($row = $res->fetch_assoc()) {
                $rows[] = $row;
            }
            $result = json_encode($rows, JSON_PRETTY_PRINT);
        } else {
            $result =  "Query ran successfully";
        }
        $conn->close();
    } catch (mysqli_sql_exception $e) {
        $result = "error running query: " . $e->getMessage();
        if ($conn) $conn->close();
    }
}


$role = str_replace("_", " ", $_SESSION["user_role"]);


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Dashboard | <?php echo strtoupper($role) ?></title>
</head>

<body>
    <header>
        <span>
            <?php echo $username . " - " . $role ?>
        </span>
        <a href="/logout.php">Logout</a>
    </header>
    <main>
        <div id="content">
            <?php
            foreach ($queries as $i => $query) {
                echo '<form action="' . htmlspecialchars($_SERVER["PHP_SELF"]) . '" method="post" class="query ' . ($query["hr"] ? "list" : "") . '"><h4>' . $query["t"] . '</h4><p>' . $query["q"] . '</p><button type="submit" name="execute" value="' . $i . '">Execute</button></form>';
            }
            ?>
        </div>
        <div id="result">
            <nav>
                <p><?php echo $last_ran ?  "Output of query <strong>" . $last_ran . "</strong>" : "" ?></p>
                <?php if ($result) { ?>
                    <form class="clear" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <button type="submit" name="clear-result">Clear</button>
                    </form>
                <?php } ?>
            </nav>
            <pre><?php echo $result ?? "Execute a query"; ?></pre>
        </div>
    </main>
    <footer>

    </footer>
    <script>
        const scroller = document.getElementById("content");
        scroller.scrollTo(0, Number(localStorage.getItem("db-scroll") ?? 0))
        scroller.addEventListener("scroll", () => {
            localStorage.setItem("db-scroll", scroller.scrollTop)
        })
    </script>
</body>

</html>