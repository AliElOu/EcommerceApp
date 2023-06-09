<?php
include "functions.php";
include "connect.php";


$user = $_POST['userId'];
$oldImg = $_POST['oldImg'];

$imgName = $_FILES["file"]['name'];
$strToArray = explode('.', $imgName);
$ext = end($strToArray);
$ext = strtolower($ext);
$imgNewName = md5(rand(1000,9999) . $imgName) . ".$ext";

if($oldImg == "user.png"){
    $response = imageUpload("file", "profile_pictures", $imgNewName);
    if($response == "succ"){
        $stmt = $con->prepare("UPDATE user set image = ? where id_user = ?");
        $stmt->execute(array($imgNewName,$user));
        $count = $stmt->rowCount();   
        printSuccess();   
    }else{
        printFailure();
    }
    
}else {
    $response = imageUpload("file", "profile_pictures", $oldImg);
    if($response == "succ"){
        printSuccess();   
    }else{
        printFailure();
    }
}



?>