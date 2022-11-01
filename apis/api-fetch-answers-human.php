<?php

// FROM CHAT
// $sQuery = $db->prepare("INSERT INTO posts VALUES (NULL, :newPostAuthorId, :newPostDescription, :newPostTime)");
// $sQuery -> bindValue(":newPostAuthorId", $newPostAuthorId);
// $sQuery -> bindValue(":newPostDescription", $newPostDescription);
// $sQuery -> bindValue(":newPostTime", $newPostTime);
// $sQuery -> execute();
// $aResults = $sQuery->rowCount();

require_once "../database.php";

$userId = $_POST["userId"];

try{

    $sQuery = $db->prepare("SELECT * FROM answers_users WHERE user_id = :userId");   
    $sQuery -> bindValue(":userId", $userId);       
    $sQuery -> execute();
    $aResults = $sQuery->fetchAll();

    if(count($aResults) > 0){

        echo(json_encode($aResults));

    } else {
        
        fillAllAnswers($userId);

    }
    
}catch(PDOException $ex){

    echo '{"status":0, "message":"PDO exception"}';

}

function fillAllAnswers($userId){

    echo('{"status": "0", "message": "No answers found for this user"}');

}

?>