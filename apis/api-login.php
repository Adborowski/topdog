<?php

require_once "../database.php";

$enteredUsername = $_POST["enteredUsername"];
$enteredPassword = $_POST["enteredPassword"];

try{

    $sQuery = $db->prepare("SELECT * FROM users WHERE 
                                                username = :enteredUsername");
    $sQuery -> bindValue(":enteredUsername", $enteredUsername);
    $sQuery -> execute();
    $aResults = $sQuery->fetchAll();

    if(count($aResults) > 0){

        if(password_verify($enteredPassword, $aResults[0]["password"])){

            session_start();

            $_SESSION["activeUsername"] = $_POST["enteredUsername"];
            $_SESSION["activePassword"] = $_POST["enteredPassword"];
            $_SESSION["activeUserId"] = $aResults[0]["user_id"];
            $_SESSION["activeUserLevel"] = $aResults[0]["user_level"];
            $_SESSION["activeUserFullName"] = $aResults[0]["full_name"];
            $_SESSION["activeUserPhoneNumber"] = $aResults[0]["phone_number"];
            $_SESSION["activeUserEmail"] = $aResults[0]["email"];

            echo('{"status":1, "user_id":'.$aResults[0]["user_id"].', "username":"'.$aResults[0]["username"].'", "user level":'.$aResults[0]["user_level"].'}');

        } else {
            // $aResults is more than 0, but password hasn't been verified
            echo '{"status":2, "message":"Wrong password"}';
        }

    } else {
        // $aResults is 0
        echo '{"status":3, "message":"User not found"}';

    }
    
}catch(PDOException $ex){

    echo '{"status":0, "message":"PDO EXCEPTION"}';

}

?>