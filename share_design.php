<?php

include "dp.php";

header("Content-Type: application/json");

if (!isset($_GET["design_id"])) {

    echo json_encode([
        "status" => false,
        "message" => "Design ID required"
    ]);

    exit;
}

$design_id = intval($_GET["design_id"]);

$token = bin2hex(random_bytes(20));

$sql = "UPDATE designs
        SET share_token = ?, is_shared = 1
        WHERE id = ?";

$stmt = $conn->prepare($sql);

$stmt->bind_param("si", $token, $design_id);

if ($stmt->execute()) {

    echo json_encode([
        "status" => true,
        "message" => "Design shared successfully",
        "share_token" => $token,
        "share_url" => "http://localhost/interiorcraft/shared_design.php?token=" . $token
    ]);

} else {

    echo json_encode([
        "status" => false,
        "message" => "Unable to share design"
    ]);
}

$stmt->close();

$conn->close();

?>