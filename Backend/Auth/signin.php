<?php

include "../connect.php" ;
include "../functions.php" ;

$email = $_POST['email'];
$password = md5($_POST['password']);

$stmt = $con->prepare("SELECT * from user where email = ? and password = ? ;");
$stmt->execute(array($email,$password));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();

if($count > 0) {
    if($data[0]['is_verified'] == "0"){
        $otp = rand(10000, 99999);
        $stmt = $con->prepare("UPDATE user SET otp_verif = ? WHERE email = ? ;");
        $stmt->execute(array($otp,$email));
        $subject = 'Verification de compte';
        $message = "Votre code de vérifiction est $otp";  
        $headers = 'From: no-reply@estg.com';
    mail($email, $subject, $message, $headers);
    }
    echo json_encode(array("status" => "success","data" => $data));
}else{
    printFailure();
}
?>