<?php

include "connect.php";

$orderId = $_POST['orderId']; 

$stmt = $con->prepare("SELECT * FROM order_details join product on product.id_product = order_details.id_product where id_order = ?");
$stmt->execute(array($orderId));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();

if ($count > 0){
    echo json_encode(array("status" => "success","data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}



?>