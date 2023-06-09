<?php

include "connect.php" ;
include "functions.php" ;


$orderId = $_POST['orderId'];


$stmt = $con->prepare("SELECT * from orders join order_details on orders.id_order = order_details.id_order where orders.id_order = ? ");
$stmt->execute(array($orderId));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
if($data[0]['status_order'] == "0") {
    $res = $con->prepare("DELETE from orders where id_order = ? ");
    $res->execute(array($orderId));  
    for($i = 0 ; $i < count($data) ; $i++){
        $res = $con->prepare("UPDATE product set quantity = quantity + ? where id_product = ? ");
        $res->execute(array($data[$i]['product_quantity'],$data[$i]['id_product']));  
    }
    printSuccess();    
}else{
    printFailure();
}



?>