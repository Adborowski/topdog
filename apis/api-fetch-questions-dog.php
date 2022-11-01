<?php

require_once "../database.php";

try{

    $sQuery = $db->prepare("SELECT question_id, question_content_dog FROM questions");          
    $sQuery -> execute();
    $aResults = $sQuery->fetchAll();

    if(count($aResults) > 0){

        echo(json_encode($aResults));

    } else {
        echo('{"status": 0, "message": "Failed to fetch questions for dog}');
    }
    
}catch(PDOException $ex){

    echo '{"status":0, "message":"PDO exception"}';

}

?>