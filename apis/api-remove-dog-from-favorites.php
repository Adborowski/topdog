<?php 

require_once "../database.php";

$userId = $_POST["userId"];
$dogId = $_POST["dogId"];

try{

    $sQuery = $db->prepare("DELETE FROM users_favorites 
                            WHERE dog_id = :dogId AND user_id = :userId");         
    $sQuery -> bindValue(':userId', $userId);           
    $sQuery -> bindValue(':dogId', $dogId);           
    $sQuery -> execute();
    $aResults = $sQuery->rowCount();

    if($aResults > 0){

        echo('{"status": 1, "message": "Favorite remove OK"}');

    } else {

        echo('{"status": 0, "message": "Favorite remove FAIL"}');

    }
    
}catch(PDOException $ex){

    echo ($ex);

}