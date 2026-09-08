<?php
$host="localhost";
$user="root";
$pass="";
$db="interiorcraft";


$host = "localhost";
$username = "root";
$password = "";
$database = "interiorcraft";

$conn = new mysqli(
    $host,
    $username,
    $password,
    $database
);

if ($conn->connect_error) {
    die("Database Connection Failed: " . $conn->connect_error);
}


$conn->set_charset("utf8mb4");
$conn = mysqli_connect("localhost", "root", "", "interiorcraft");

if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}

?>
