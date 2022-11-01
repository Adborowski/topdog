<?php

require_once "../database.php";

$dogId = $_POST["dogId"];

try{

    $sQuery = $db->prepare("SELECT * FROM answers_dogs WHERE dog_id = :dogId");   
    $sQuery -> bindValue(":dogId", $dogId);       
    $sQuery -> execute();
    $aResults = $sQuery->fetchAll();

    if(count($aResults) > 0){

        echo(json_encode($aResults));

    } else {
        
        echo('{"status": "0", "message": "No answers found for this user"}');

    }
    
}catch(PDOException $ex){

    echo '{"status":0, "message":"PDO exception"}';

}

?>