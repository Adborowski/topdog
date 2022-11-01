<?php 

require_once "../database.php";

$userId = $_POST["userId"];
$dogId = $_POST["dogId"];

try{

    $sQuery = $db->prepare("SELECT * FROM users_favorites WHERE user_id = :userId AND dog_id = :dogId");         
    $sQuery -> bindValue(':userId', $userId);           
    $sQuery -> bindValue(':dogId', $dogId);           
    $sQuery -> execute();
    $aResults = $sQuery->rowCount();

    if($aResults > 0){

        echo('{"status": 1, "message": "Dog is in favorites"}');

    } else {

        echo('{"status": 0, "message": "Dog is not in favorites"}');

    }
    
}catch(PDOException $ex){

    echo ($ex);

}