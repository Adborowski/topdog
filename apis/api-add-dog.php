<?php

// variables for managing image upload
$level = 2;
$uploaddir = dirname(__FILE__, $level).'/assets/images/dogs';
$uploadfile = $uploaddir .'/'. basename($_FILES['newDogImage']['name']);

// let's change the name of the file to something custom
// then again, the database is designed so that this isn't necessary
$ext = pathinfo($uploadfile, PATHINFO_EXTENSION);
$newFileName = "testName";
//  in the end I'm not renaming the files at all, but I'll keep this code, maybe I'll use it later

$newDogName = $_POST["newDogName"];
$newDogDescription = $_POST["newDogDescription"];
$newDogImage = $_FILES["newDogImage"];

try{
    
    require_once "../database.php";
    // $db->beginTransaction();

    $sQuery = $db->prepare("INSERT INTO dogs 
                            VALUES 
                            (NULL, :newDogName, :newDogDescription)");
    $sQuery -> bindValue(':newDogName', $newDogName);           
    $sQuery -> bindValue(':newDogDescription', $newDogDescription);                      
    $sQuery -> execute();
    $aResults = $sQuery->rowCount();
    $lastInsertedId = $db->lastInsertId();
    // $aResults = $sQuery->mysql_affected_rows();

    if($aResults > 0){

        addDogImage($lastInsertedId);

    } else {
        echo('{"status": 0, "message": "Dog add FAIL (text-side)"}');
    }
    
}catch(PDOException $ex){

    echo ($ex);

};

function addDogImage($newDogId){

    // if the image upload was a success...
    $level = 2;
    $uploaddir = dirname(__FILE__, $level).'/assets/images/dogs';
    $uploadfile = $uploaddir .'/'. basename($_FILES['newDogImage']['name']);
    if (move_uploaded_file($_FILES["newDogImage"]['tmp_name'], $uploadfile)) {

        // ...add the relevant URL into the database
        try{

            require "../database.php";
            $level = 1;
            // $uploaddir = dirname(__FILE__, $level).'/assets/images/dogs';
            $uploaddir = 'assets/images/dogs';
            $uploadfile = $uploaddir .'/'. basename($_FILES['newDogImage']['name']);
            
            $sQuery = $db->prepare("INSERT INTO dogs_images 
                                    VALUES 
                                    (NULL, :newDogId, :newDogImageUrl)");
            $sQuery -> bindValue(':newDogId', $newDogId);           
            $sQuery -> bindValue(':newDogImageUrl', $uploadfile);                      
            $sQuery -> execute();
            $aResults = $sQuery->rowCount();
            $lastInsertedId = $newDogId;
            // $aResults = $sQuery->mysql_affected_rows();
        
            if($aResults > 0){
        
                echo('{"status": 1, "message": "Dog add OK", "dog_id": '.$lastInsertedId.'}');
        
            } else {

                echo('{"status": 0, "message": "Dog add FAIL"}');
            }
            
        }catch(PDOException $ex){
        
            echo ($ex);
        
        };

    // this runs instead of the try/catch if image upload has failed
    } else {
        echo('{"status": 0, "message": "Image upload FAIL"}');
    }
    
    // echo 'Here is some more debugging info:';
    // print_r($_FILES);

};



?>