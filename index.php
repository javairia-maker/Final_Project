<?php

session_start();

include("dp.php");

$isLoggedIn=false;

if(isset($_SESSION['user_id']))
{
    $isLoggedIn=true;
}

?>
<a href="<?php echo $isLoggedIn ? 'design.php' : 'login.php'; ?>">
Select Design Type
</a>
<a href="<?php echo $isLoggedIn ? 'interior.php' : 'login.php'; ?>">
Select Interior Type
</a>
<a href="<?php echo $isLoggedIn ? 'room.php' : 'login.php'; ?>">
Choose Room
</a>
<a href="<?php echo $isLoggedIn ? 'space.php' : 'login.php'; ?>">
Define Space
</a>
<a href="<?php echo $isLoggedIn ? 'furniture.php' : 'login.php'; ?>">
Add Furniture
</a>
<a href="<?php echo $isLoggedIn ? 'customize.php' : 'login.php'; ?>">
Customize
</a>
<a href="<?php echo $isLoggedIn ? 'view3d.php' : 'login.php'; ?>">
3D View
</a>
<a href="<?php echo $isLoggedIn ? 'save_design.php' : 'login.php'; ?>">
Save Design
</a>
<a href="<?php echo $isLoggedIn ? 'share.php' : 'login.php'; ?>">
Share Design
</a>