<?php

include "connect.php";
include "functions.php";

class ProductsModel {
    public $id;
    public $price;
  
    function __construct($id, $price) {
      $this->id = $id;
      $this->price = $price;
    }
  }
  
  class CartModel {
    public $product;
    public $quantity;
  
    function __construct($product, $quantity) {
      $this->product = $product;
      $this->quantity = $quantity;
    }
  }
  
$idd = date('YmdHis');
$data = json_decode(file_get_contents('php://input'), false);
$user_id = $data->user_id;
$shipping_address = $data->shipping_address;
$phone = $data->phone;
$status = $data->status;


$cart = [];
foreach ($data->cart as $item) {
  $product = new ProductsModel($item->product->id, $item->product->price);
  $cartItem = new CartModel($product, $item->quantity);
  $cart[] = $cartItem;
}
$count = 0;
foreach ($cart as $item) {
  $stmt = $con->prepare("SELECT * from product where id_product = ? and quantity < ?");
  $stmt->execute(array($item->product->id, $item->quantity));
  $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
  $count  = $count + $stmt->rowCount();
}

if($status == "cod"){
  if($count == 0){
    $stmt = $con->prepare("INSERT INTO orders (`id_order`, `id_user`, `status_order`, `shipping_address`, `phone`	) VALUES (?,?,?,?,?)");
    $stmt->execute(array($idd, $user_id, "0",$shipping_address,$phone));
  
    foreach ($cart as $item) {
        $stmt = $con->prepare("INSERT INTO order_details (`id_order`, `id_product`,`product_quantity`, `product_price`) VALUES (?,?,?,?);Update product set quantity = quantity - ? where id_product = ? ;");
        $stmt->execute(array($idd, $item->product->id, $item->quantity, $item->product->price,$item->quantity,$item->product->id));
    }
  printSuccess();
  } else{
  printFailure();
  }
}elseif($status == "checkquant"){
  if($count == 0){
    printSuccess();
  } else{
  printFailure();
  }
}elseif($status == "payed"){
  $stmt = $con->prepare("INSERT INTO orders (`id_order`, `id_user`, `status_order`, `shipping_address`, `phone`	) VALUES (?,?,?,?,?)");
  $stmt->execute(array($idd, $user_id, "0",$shipping_address,$phone));
  
  foreach ($cart as $item) {
    $stmt = $con->prepare("INSERT INTO order_details (`id_order`, `id_product`,`product_quantity`, `product_price`) VALUES (?,?,?,?);Update product set quantity = quantity - ? where id_product = ? ;");
    $stmt->execute(array($idd, $item->product->id, $item->quantity, $item->product->price,$item->quantity,$item->product->id));
  }
  printSuccess();
}







?>