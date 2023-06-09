<?php

include "../connect.php" ;
include "../functions.php" ;

$email = $_POST['email'];

$stmt = $con->prepare("SELECT * from user where email = ? ;");
$stmt->execute(array($email));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();

if($count > 0) {
    $otp = rand(10000, 99999);
    $expiry = date('Y-m-d H:i:s', strtotime('+2 minutes'));
    $stmt = $con->prepare("UPDATE user SET otp_reset = ?, code_expiration = ? WHERE email = ? ;");
    $stmt->execute(array($otp,$expiry,$email));
   
    $subject = 'Mot de passe oublié OTP';
    $message = "Votre code de réinitialisation est $otp";  
    $headers = 'From: no-reply@estg.com';
    mail($email, $subject, $message, $headers);
    printSuccess();
}else{
    printFailure();
}





?>