<?php


session_start();

$username = $_SESSION["user"];
$role = $_SESSION["user_role"];

$queries = [];

switch ($role) {
    case 'admin':
        $queries = [
            [
                'q' => 'INSERT INTO department(name) VALUES("Sales Department");',
                't' => "Insert Department",
                'hr' => false
            ],
            [
                'q' => 'SELECT * FROM department;',
                't' => "List Departments",
                'hr' => true
            ],
            [
                'q' => 'DELETE FROM department WHERE id NOT IN (SELECT * FROM (
                    SELECT MAX(id)
                    FROM department
                ) AS t);',
                't' => "Delete Departments(except last one)",
                'hr' => false
            ],
            [
                'q' => 'INSERT INTO employee(name,address,contact_no,status,reg_no,termination_date,hire_date,department) VALUES("John Wick","1234 Continental Street, New York, NY","","f","JW123456",NULL,"2014-01-15",(
                    SELECT MAX(id)
                    FROM department
                ));',
                't' => "Insert Employee",
                'hr' => false
            ],
            [
                'q' => 'SELECT * FROM employee;',
                't' => "List Employees",
                'hr' => true
            ],
            [
                'q' => 'DELETE FROM employee;',
                't' => "Delete Employees",
                'hr' => false
            ],
        ];
        break;
}




if (isset($_POST['execute'])) {
    $query = $queries[$_POST['execute']];

    try {
        $conn = new mysqli("localhost", $username, $username . '123', "pharmalink");
        $res = $conn->query($query['q']);
        if ($query['hr']) {
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
            <form class="clear" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                <button type="submit" name="clear-result">Clear</button>
            </form>
            <pre><?php echo $result ?? "Execute a query"; ?></pre>
        </div>
    </main>
    <footer>

    </footer>
</body>

</html>