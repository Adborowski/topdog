<?php 

require_once "../database.php";

$dogId = $_POST["dogId"];
$questionId = $_POST["questionId"];
$answerValue = $_POST["answerValue"];

try{

    $sQuery = $db->prepare("REPLACE INTO answers_dogs 
                            (answer_id, question_id, dog_id, dog_answer) 
                            VALUES 
                            (NULL, :questionId, :dogId, :answerValue)");
    $sQuery -> bindValue(':answerValue', $answerValue);           
    $sQuery -> bindValue(':dogId', $dogId);           
    $sQuery -> bindValue(':questionId', $questionId);           
    $sQuery -> execute();
    $aResults = $sQuery->rowCount();
    // $aResults = $sQuery->mysql_affected_rows();

    if($aResults > 0){

        // echo(json_encode($aResults));
        echo('{"status": 1, "message": "Answer add OK"}');

    } else {
        echo('{"status": 0, "message": "Answer add FAIL"}');
    }
    
}catch(PDOException $ex){

    echo ($ex);

}