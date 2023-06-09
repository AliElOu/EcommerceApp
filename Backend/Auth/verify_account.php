<?php


include "../connect.php" ;
include "../functions.php" ;


$email = $_POST['email'];
$otp = $_POST['otp'];


$res = $con->prepare("SELECT * FROM user WHERE email = ? AND otp_verif = ? ;");
$res->execute(array($email,$otp));

$count = $res->rowCount();



if ($count > 0) {
    $res = $con->prepare("UPDATE user SET is_verified = ? ,otp_verif = NULL WHERE email = ? ;");
    $res->execute(array("1",$email));
    printSuccess();
} else {
    printFailure();
}

?>