<?php

include "dp.php";

$sql = "SELECT * FROM styles";
$result = mysqli_query($conn, $sql);

?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Choose Interior Design Style</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f7f7fb;
            margin: 0;
            padding: 40px;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: auto;
        }

        h1 {
            text-align: center;
            color: #222;
        }

        h1 span {
            color: #6655e8;
        }

        .subtitle {
            text-align: center;
            color: #777;
            margin-bottom: 40px;
        }

        .styles {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .style-card {
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .style-card h2 {
            margin-bottom: 10px;
        }

        .style-card p {
            color: #777;
            min-height: 50px;
        }

        .btn {
            display: block;
            text-align: center;
            text-decoration: none;
            color: #6655e8;
            border: 2px solid #e0dcf8;
            padding: 10px;
            border-radius: 8px;
            margin-top: 15px;
        }

        .btn:hover {
            background: #6655e8;
            color: white;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>
        Choose your <span>interior design style</span>
    </h1>

    <p class="subtitle">
        Select a style that matches your taste
    </p>

    <div class="styles">

        <?php

        while ($row = mysqli_fetch_assoc($result)) {

        ?>

            <div class="style-card">

                <h2>
                    <?php echo $row['style_name']; ?>
                </h2>

                <p>
                    <?php echo $row['description']; ?>
                </p>

                <a
                    href="save_style.php?style_id=<?php echo $row['id']; ?>&room_id=<?php echo $_GET['room_id']; ?>"
                    class="btn"
                >
                    Select Style
                </a>

            </div>

        <?php

        }

        ?>

    </div>

</div>

</body>

</html>