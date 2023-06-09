<?php
include "connect.php";

$catId = $_POST['catId'];
$userId = $_POST['userid'];

try {
    $stmt = $con->prepare("SELECT p.*, IF(f.id_user IS NOT NULL, 1, 0) AS isFavorit FROM product p LEFT JOIN favoris f ON p.id_product = f.id_product AND f.id_user = ? where id_category = ? ");
    $stmt->execute(array($userId,$catId));
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();

    
    if ($count > 0){
        echo json_encode(array("status" => "success","data" => $data));
    } else {
        echo json_encode(array("status" => "failure"));
    }

  
    



} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}


?>