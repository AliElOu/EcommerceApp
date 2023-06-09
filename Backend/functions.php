<?Php

function insertData($table, $data, $json = true)
{
    global $con;
    foreach ($data as $field => $v)
        $ins[] = ':' . $field;
    $ins = implode(',', $ins);
    $fields = implode(',', array_keys($data));
    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

    $stmt = $con->prepare($sql);
    foreach ($data as $f => $v) {
        $stmt->bindValue(':' . $f, $v);
    }
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
    if ($count > 0) {
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "failure"));
    }
  }
    return $count;
}

function imageUpload($imageRequest, $folderName, $imgNewName) {
    $imgName = $_FILES[$imageRequest]['name'];
    $imgTmp = $_FILES[$imageRequest]['tmp_name'];
    $imgSize = $_FILES[$imageRequest]['size'];
    $allowExt = array('jpg', 'jpeg', 'png', 'gif');
    $strToArray = explode('.', $imgName);
    $ext = end($strToArray);
    $ext = strtolower($ext);
    if(!empty($imgName) && !in_array($ext, $allowExt)){
        return "err";
    }
    elseif($imgSize > 2 * 1048576){
        return "err";
    }
    else{
        move_uploaded_file($imgTmp, $folderName . "/" . $imgNewName);
        return "succ";
    }
}


function printFailure(){
    echo json_encode(array("status" => "failure"));
}

function printSuccess(){
    echo json_encode(array("status" => "Success"));
}

?>