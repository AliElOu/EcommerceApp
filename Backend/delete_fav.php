<?php

include "connect.php";

$product = $_POST['productId'];
$user = $_POST['userId'];

$stmt = $con->prepare("DELETE FROM favoris WHERE id_user = ? and id_product = ?");
$stmt->execute(array($user,$product));


if ($stmt){
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure"));
}

?>
