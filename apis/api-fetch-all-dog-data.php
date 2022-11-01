<?php

require_once "../database.php";
// SELECT * FROM dogs INNER JOIN dogs_images USING (dog_id)
try{
    $sQuery = $db->prepare("SELECT * FROM dogs INNER JOIN answers_dogs USING (dog_id)");        
    $sQuery -> execute();
    $aResults = $sQuery->fetchAll();

    if(count($aResults) > 0){

        echo(json_encode($aResults));

    } else {
        
        echo('{"status": "0", "message": "No dog data found"}');

    }
    
}catch(PDOException $ex){

    echo '{"status":0, "message":"PDO exception"}';

}

?>