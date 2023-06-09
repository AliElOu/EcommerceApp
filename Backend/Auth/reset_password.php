<?php

include "../connect.php" ;
include "../functions.php" ;


$email = $_POST['email'];
$nwpass = md5($_POST['password']);


$res = $con->prepare("UPDATE user SET password = ? WHERE email = ? ;");
$res->execute(array($nwpass,$email));

printSuccess();



?>