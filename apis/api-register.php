<?php

require_once "../database.php";

$newUsername = $_POST["newUsername"];
// $newPassword = $_POST["newPassword"];
$newPassword = $_POST["newPassword"];


// let's validate password length
$minimumPasswordLength = 8;

if (strlen($newUsername) == 0){
    echo '{"status":4, "message":"Username is empty"}';
    // if the username isn't empty, continue
} else {

    if (strlen($newPassword) < $minimumPasswordLength){
        echo '{"status":3, "message":"Password too short", "minLength":'.$minimumPasswordLength.'}';
        // if the password is long enough, continue

    } else {
    
        $newHashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);
        
        try{
            
            $sQuery = $db->prepare("INSERT INTO users VALUES (NULL, :newUsername, :newPassword, 1, NULL, NULL, NULL)");
            $sQuery -> bindValue(":newUsername", $newUsername);
            $sQuery -> bindValue(":newPassword", $newHashedPassword);
            $sQuery -> execute();
        
            $idQuery = $db->prepare("SELECT * FROM users ORDER BY user_id DESC LIMIT 1");
            $idQuery -> execute();
            $idResults = $idQuery->fetchAll();
            $aResults = $sQuery->rowCount();
        
            if($aResults > 0){
                
                session_start();
                $_SESSION["activeUsername"] = $newUsername;
                $_SESSION["activePassword"] = $newHashedPassword;
                $_SESSION["activeUserId"] = $idResults[0]['user_id'];
                $_SESSION["activeUserLevel"] = $idResults[0]['user_level'];
                $_SESSION["activeUserFullName"] = $idResults[0]['full_name'];
                $_SESSION["activeUserEmail"] = $idResults[0]['email'];
                $_SESSION["activeUserPhoneNumber"] = $idResults[0]['phone_number'];

                echo '{"status":1, "message":"User registration OK"}';
                // var_dump($idResults);
                
            } else {
        
                echo '{"status":0, "message":"User registration failed}';
                
            } // end of else (if aResults>0)
            
        }catch(PDOException $ex){
        
            // echo '{"status":2, "message":'.$ex.'}';
            echo '{"status":2, "message":"PDO Exception"}';
        
        } // end of catch

    } // end of IF for password length validation

} // end of IF for username length validation

?>