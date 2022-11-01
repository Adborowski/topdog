<?php 

// mysql> REPLACE INTO books
//     (id, title, author, year_published)
// VALUES
//     (1, 'Green Eggs and Ham', 'Dr. Seuss', 1960);
// Query OK, 2 rows affected (0.00 sec)


require_once "../database.php";

$userId = $_POST["userId"];
$questionId = $_POST["questionId"];
$answerValue = $_POST["answerValue"];

try{

    $sQuery = $db->prepare("REPLACE INTO answers_users 
                            (answer_id, question_id, user_id, user_answer) 
                            VALUES 
                            (NULL, :questionId, :userId, :answerValue)");
    $sQuery -> bindValue(':answerValue', $answerValue);           
    $sQuery -> bindValue(':userId', $userId);           
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