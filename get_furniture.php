<?php

include "dp.php";

$sql = "SELECT id, name, image FROM furniture ORDER BY id DESC";

$result = $conn->query($sql);

$furniture = [];

if ($result) {

    while ($row = $result->fetch_assoc()) {
        $furniture[] = $row;
    }

}

header("Content-Type: application/json");

echo json_encode([
    "status" => true,
    "data" => $furniture
]);

$conn->close();

?>
{
    "status": true,
    "data": [
        {
            "id": 1,
            "name": "Sofa",
            "image": "sofa.png"
        },
        {
            "id": 2,
            "name": "Bed",
            "image": "bed.png"
        }
    ]
}