<?php

include "connect.php";

$product = $_POST['productId'];
$user = $_POST['userId'];

$stmt = $con->prepare("INSERT INTO favoris VALUES (?,?)");
$stmt->execute(array($user,$product));


if ($stmt){
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure"));
}

?>
