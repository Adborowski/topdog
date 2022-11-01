<?php

$userId = $_POST["userId"];

require_once "../database.php";

try{

    $sQuery = $db->prepare("SELECT * FROM dogs 
                            INNER JOIN dogs_images USING (dog_id) 
                            INNER JOIN users_favorites USING (dog_id) 
                            WHERE user_id = :userId"); 
    $sQuery -> bindValue(':userId', $userId);            
    $sQuery -> execute();
    $aResults = $sQuery->fetchAll();

    if(count($aResults) > 0){

        echo(json_encode($aResults));

    } else {
        echo('{"status": 0, "message": "No favorites"}');
    }
    
}catch(PDOException $ex){

    echo '{"status":0, "message":"PDO exception"}';

}


?>