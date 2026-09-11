

<?php

session_start();

include("dp.php");

if(isset($_POST['register']))
{

$name = $_POST['name'];
$phone = $_POST['phone'];
$email = $_POST['email'];
$password = $_POST['password'];
$confirm_password = $_POST['confirm_password'];

// Check passwords
if($password != $confirm_password)
{
    echo "Passwords do not match";
}
else
{

// Check email already exists
$sql = "SELECT * FROM users WHERE email='$email'";

$result = mysqli_query($conn, $sql);

if(mysqli_num_rows($result) > 0)
{
    echo "Email already registered";
}
else
{

// Password hash
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Insert user
$sql = "INSERT INTO users (name, phone, email, password)
        VALUES ('$name', '$phone', '$email', '$hashed_password')";

if(mysqli_query($conn, $sql))
{
    echo "Registration Successful";

    header("Location: login.php");
    exit;
}
else
{
    echo "Registration Failed";
}

}

}

}

?>

<!DOCTYPE html>

<html>

<head>

<title>Registration</title>

</head>

<body>

<form method="POST">

<input type="text" name="name" placeholder="Name" required>

<br><br>

<input type="text" name="phone" placeholder="Phone Number" required>

<br><br>

<input type="email" name="email" placeholder="Email" required>

<br><br>

<input type="password" name="password" placeholder="Password" required>

<br><br>

<input type="password" name="confirm_password" placeholder="Confirm Password" required>

<br><br>

<button type="submit" name="register">

Create Account

</button>

</form>

</body>

</html>



