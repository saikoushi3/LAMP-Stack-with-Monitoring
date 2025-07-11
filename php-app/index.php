<!DOCTYPE html>
<html>
<head>
    <title>LAMP Stack Test</title>
</head>
<body>
    <h1>Welcome to the LAMP Stack!</h1>
    <p>This page is served by Apache and PHP.</p>
    <?php
        // Test PHP processing
        echo "<p>Current PHP version: " . phpversion() . "</p>";

        // Test MySQL connection (optional, requires database credentials)
        /*
        $servername = "localhost";
        $username = "root";
        $password = "your_mysql_root_password"; // Change this

        // Create connection
        $conn = new mysqli($servername, $username, $password);

        // Check connection
        if ($conn->connect_error) {
            die("<p>MySQL Connection failed: " . $conn->connect_error . "</p>");
        }
        echo "<p>Connected successfully to MySQL!</p>";
        $conn->close();
        */
    ?>
</body>
</html>