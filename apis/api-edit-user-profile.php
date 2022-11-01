<?php

session_start();

$editedFullName = $_POST["editedFullName"];
$editedEmail = $_POST["editedEmail"];
$editedPhoneNumber = $_POST["editedPhoneNumber"];
$userId = $_SESSION["activeUserId"];

try{

    require_once "../database.php";

    $sQuery = $db->prepare("UPDATE users 
                            SET 
                                full_name = :editedFullName,
                                email = :editedEmail,
                                phone_number = :editedPhoneNumber
                            WHERE
                                user_id = :userId");
    $sQuery -> bindValue(':editedFullName', $editedFullName);                              
    $sQuery -> bindValue(':editedEmail', $editedEmail);                              
    $sQuery -> bindValue(':editedPhoneNumber', $editedPhoneNumber);                              
    $sQuery -> bindValue(':userId', $userId);                                                           
    $sQuery -> execute();
    $aResults = $sQuery->rowCount();
    // $this->db->affected_rows();

    if($aResults > 0){

        $_SESSION["activeUserFullName"] = $editedFullName;
        $_SESSION["activeUserEmail"] = $editedEmail;
        $_SESSION["activeUserPhoneNumber"] = $editedPhoneNumber;
        echo('{"status": 1, "message": "[OK] Profile edited"}');

    } else {

        echo('{"status": 0, "message": "[FAIL] Profile not edited (error, or no change)"}');

    }
    
}catch(PDOException $ex){

    echo ($ex);

};

?>