<?php 






// All of this got replaced with a constraint(unique)




// $_POST["newUsername"] = "a";

// "SELECT count(*) FROM `table` WHERE foo = bar"; 

require_once "../database.php";

$usernameToCheckFor = $_POST["newUsername"];

    try{
    
    $sQuery = $db->prepare("SELECT * FROM users WHERE username = :usernameToCheckFor");
    $sQuery -> bindValue(":usernameToCheckFor", $usernameToCheckFor);
    $sQuery -> execute();
    $aResults = $sQuery->fetchAll();


    if(count($aResults) > 0){
        echo('{"status": 0, "message": "ERROR: User Duplicate"}');
    } else {
        echo('{"status": 1, "message": "SUCCESS: User Unique"}');
    }
        
    }catch(PDOException $ex){
            echo ($ex);

    }

?>