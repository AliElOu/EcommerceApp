<?php

include "connect.php";

$userId = $_POST['userid']; 

$stmt = $con->prepare("SELECT * FROM orders where id_user = ?");
$stmt->execute(array($userId));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();

if ($count > 0){
    echo json_encode(array("status" => "success","data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}



?>