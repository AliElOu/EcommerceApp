<?php


include "../connect.php" ;
include "../functions.php" ;


$email = $_POST['email'];
$otp = $_POST['otp'];


$res = $con->prepare("SELECT * FROM user WHERE email = ? AND otp_reset = ? AND code_expiration > NOW()");
$res->execute(array($email,$otp));

$count = $res->rowCount();



if ($count > 0) {
    $res = $con->prepare("UPDATE user SET otp_reset = NULL,code_expiration = NULL WHERE email = ? ;");
    $res->execute(array($email));
    printSuccess();
} else {
    printFailure();
}

?>