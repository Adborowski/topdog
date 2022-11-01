<?php 

require_once "../database.php";

$userId = $_POST["userId"];
$dogId = $_POST["dogId"];

try{

    $sQuery = $db->prepare("REPLACE INTO users_favorites 
                            (favorite_id, user_id, dog_id) 
                            VALUES 
                            (NULL, :userId, :dogId)");         
    $sQuery -> bindValue(':userId', $userId);           
    $sQuery -> bindValue(':dogId', $dogId);           
    $sQuery -> execute();
    $aResults = $sQuery->rowCount();

    if($aResults > 0){

        echo('{"status": 1, "message": "Favorite add OK"}');

    } else {

        echo('{"status": 0, "message": "Favorite add FAIL"}');

    }
    
}catch(PDOException $ex){

    echo ($ex);

}