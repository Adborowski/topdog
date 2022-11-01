<?php

require_once "../database.php";

try{

    $sQuery = $db->prepare("SELECT * FROM answers_dogs");        
    $sQuery -> execute();
    $aResults = $sQuery->fetchAll();

    if(count($aResults) > 0){

        echo(json_encode($aResults));

    } else {
        
        echo('{"status": "0", "message": "No answers found for all dogs"}');

    }
    
}catch(PDOException $ex){

    echo '{"status":0, "message":"PDO exception"}';

}

?>