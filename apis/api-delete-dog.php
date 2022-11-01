<?php

$dogId = $_POST["dogId"];

try{

    require_once "../database.php";

    $sQuery = $db->prepare("DELETE FROM dogs WHERE dog_id = :dog_id");
    $sQuery -> bindValue(':dog_id', $dogId);                              
    $sQuery -> execute();
    $aResults = $sQuery->rowCount();

    if($aResults > 0){

        echo('{"status": 1, "message": "[OK] Dog deleted"}');

    } else {
        echo('{"status": 0, "message": "[FAIL] Dog not deleted"}');
    }
    
}catch(PDOException $ex){

    echo ($ex);

};

?>