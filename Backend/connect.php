<?php
$host="localhost";
$user= "id20721662_root";
$pass = "7unFCn6d-gWgc,D";
$db = "id20721662_ecommerceapp"; 
  
try{
    $con=new PDO("mysql:host=$host;dbname=$db",$user,$pass);
} catch(Exception $e){
    echo $e;
}

?>