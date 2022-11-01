<?php

error_reporting(0);

try{

  $sUserName = 'root';
  $sPassword = 'root';
  $sConnection = "mysql:host=localhost; dbname=dogs; charset=utf8mb4";

  $aOptions = array(
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
  );

  $db = new PDO( $sConnection, $sUserName, $sPassword, $aOptions );

}catch( PDOException $e){
  echo $e->getMessage();
  exit();
}






