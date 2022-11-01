<?php

require_once "../database.php";

try{

    $sQuery = $db->prepare("SELECT * FROM videos");          
    $sQuery -> execute();
    $aResults = $sQuery->fetchAll();

    if(count($aResults) > 0){

        echo(json_encode($aResults));

    } else {
        echo('{"status": 0, "message": "Failed to fetch videos}');
    }
    
}catch(PDOException $ex){

    echo '{"status":0, "message":"PDO exception"}';

}


?>