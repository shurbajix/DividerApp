<?php
// Retrieve POST data from Flutter app
$name = $_POST['name'];
$password = $_POST['password'];

// Connect to MySQL database
$servername = "localhost";
$username = "your_username";
$password = "your_password";
$dbname = "your_database_name";

$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

// Store data in MySQL database
$sql = "INSERT INTO users (name, password)
        VALUES ('$name', '$password')";

if (mysqli_query($conn, $sql)) {
  echo "Data stored successfully";
} else {
  echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
?>