<?php 
// INSERT INTO table (a,b,c) VALUES (4,5,6) ON DUPLICATE KEY UPDATE c=VALUES(c);

require_once "../database.php";

$userId = $_POST["userId"];
$missingAnswerId = $_POST["missingAnswerId"];

try{

    $sQuery = $db->prepare("INSERT INTO answers_users (answer_id, question_id, user_id, user_answer) VALUES (NULL, :questionId, :userId, :answerValue ON DUPLICATE KEY UPDATE answer_id = VALUES(answer_id), question_id = :questionId, user_id = :userId, user_answer = :answerValue");
    $sQuery -> bindValue(':answerValue', $answerValue);           
    $sQuery -> bindValue(':userId', $userId);           
    $sQuery -> bindValue(':questionId', $questionId);           
    $sQuery -> execute();
    $aResults = $sQuery->rowCount();
    // $aResults = $sQuery->mysql_affected_rows();

    if($aResults > 0){

        // echo(json_encode($aResults));
        echo('{"status": 1, "message": "Answer change OK"}');

    } else {
        echo('{"status": 0, "message": "Answer change FAIL (or same answer)"}');
    }
    
}catch(PDOException $ex){

    // echo '{"status":0, "message":"PDO Exception"}';
    echo ($ex);

}