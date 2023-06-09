<?php
include "connect.php";

try {
    $userId = $_POST['userid']; 

    $catStmt = $con->query("SELECT * FROM category_product");
    $catData = $catStmt->fetchAll(PDO::FETCH_ASSOC);
    $catCount  = $catStmt->rowCount();

    $newProdStmt = $con->prepare("SELECT p.*, IF(f.id_user IS NOT NULL, 1, 0) AS isFavorit FROM product p LEFT JOIN favoris f ON p.id_product = f.id_product AND f.id_user = ?  order by id_product asc");
    $newProdStmt->execute(array($userId));
    $newProdData = $newProdStmt->fetchAll(PDO::FETCH_ASSOC);
    $newProdCount  = $newProdStmt->rowCount();

    $popProdStmt = $con->prepare("SELECT p.*, IF(f.id_user IS NOT NULL, 1, 0) AS isFavorit FROM product p LEFT JOIN favoris f ON p.id_product = f.id_product AND f.id_user = ? order by id_product desc");
    $popProdStmt->execute(array($userId));
    $popProdData = $popProdStmt->fetchAll(PDO::FETCH_ASSOC);
    $popProdCount  = $popProdStmt->rowCount();

    if ($catCount > 0 && $newProdCount > 0 && $popProdCount > 0){
        $dataExists = "success";
    } else {
        $dataExists = "failure";
    }

    echo json_encode(array("status" => $dataExists, "data" => array("cat" => $catData,"newProd" => $newProdData,"popProd" => $popProdData)));
  
    



} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}


?>