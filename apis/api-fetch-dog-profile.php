<?php
require_once "../database.php";
$dogId = $_GET["dogId"];

try{

    $sQuery = $db->prepare("SELECT * FROM dogs INNER JOIN dogs_images USING (dog_id) WHERE dog_id = :dogId");      
    $sQuery -> bindValue(':dogId', $dogId);                    
    $sQuery -> execute();
    $aResults = $sQuery->fetchAll();

    if(count($aResults) > 0){

        echo(json_encode($aResults));

    } else {
        echo('{"status": 0, "message": "Failed to fetch dog profile}');
    }
    
}catch(PDOException $ex){

    echo '{"status":0, "message":"PDO exception"}';

}

?>