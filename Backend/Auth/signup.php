<?php


include "../connect.php" ;
include "../functions.php" ;

$username = $_POST['username'];
$password = md5($_POST['password']);
$email = $_POST['email'];
$verifycode = rand(10000, 99999);
$adresse = $_POST['adresse'];
$phone = $_POST['phone'];

$res = $con->prepare("SELECT * from user where email = ? or username = ? ;");
$res->execute(array($email,$username));
$count = $res->rowCount();

if($count > 0) {
    printFailure();
} else {
    
    $data = array(
        "username" => $username ,
        "password" => $password ,
        "email" => $email ,
        "otp_verif" => $verifycode ,
        "adresse" => $adresse ,
        "phone" => $phone ,
        "is_verified" => "0" ,
    );
    $subject = 'Verification de compte';
    $message = "Votre code de vérifiction est $verifycode";  
    $headers = 'From: no-reply@estg.com';
    mail( $email, $subject, $message, $headers);
    
    insertData('user', $data);
    
}


?>