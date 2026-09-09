<?php

$conn = mysqli_connect("localhost", "root", "", "interiorcraft");

if (!$conn) {
    die("Database connection failed");
}

$sql = "SELECT * FROM office_styles ORDER BY id ASC";
$result = mysqli_query($conn, $sql);

?>



<?php while ($row = mysqli_fetch_assoc($result)) { ?>

<div class="style-card">

    <img 
        src="images/office/<?php echo $row['image']; ?>" 
        alt="<?php echo $row['style_name']; ?>"
    >

    <h2>
        <?php echo $row['style_name']; ?>
    </h2>

    <p>
        <?php echo $row['description']; ?>
    </p>

    <form action="office-style-save.php" method="POST">

        <input 
            type="hidden" 
            name="style_id" 
            value="<?php echo $row['id']; ?>"
        >

        <button type="submit">
            Select Style
        </button>

    </form>

</div>

<?php } ?>