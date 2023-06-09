<?php

include "connect.php" ;
include "functions.php" ;


$email = $_POST['email'];
$nwpass = md5($_POST['password']);
$oldpass = md5($_POST['oldPassword']);


$stmt = $con->prepare("SELECT * from user where email = ? and password = ? ;");
$stmt->execute(array($email,$oldpass));
$count = $stmt->rowCount();

if($count > 0) {
    $res = $con->prepare("UPDATE user SET password = ? WHERE email = ? ;");
    $res->execute(array($nwpass,$email));  
    printSuccess();    
}else{
    printFailure();
}









?>