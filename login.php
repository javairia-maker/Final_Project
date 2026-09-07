<?php

session_start();

include("dp.php");

if(isset($_POST['login']))
{

$email=$_POST['email'];

$password=$_POST['password'];

$sql="SELECT * FROM users WHERE email='$email'";

$result=mysqli_query($conn,$sql);

if(mysqli_num_rows($result)>0)
{

$row=mysqli_fetch_assoc($result);

if(password_verify($password,$row['password']))
{

$_SESSION['user_id']=$row['id'];

$_SESSION['name']=$row['name'];

header("Location:index.php");

}
else
{

echo "Wrong Password";

}

}
else
{

echo "User Not Found";

}

}

?>

<!DOCTYPE html>

<html>

<head>

<title>Login</title>

</head>

<body>

<form method="POST">

<input type="email" name="email" placeholder="Email" required>

<br><br>

<input type="password" name="password" placeholder="Password" required>

<br><br>

<button type="submit" name="login">

Login

</button>

</form>

</body>

</html>