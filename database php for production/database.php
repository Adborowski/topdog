<?php

try{

  $sUserName = 'adamboro_topdog';
  $sPassword = '2198701@Aa';
  $sConnection = "mysql:host=localhost; dbname=adamboro_topdog; charset=utf8mb4";

  $aOptions = array(
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
  );

  $db = new PDO( $sConnection, $sUserName, $sPassword, $aOptions );

}catch( PDOException $e){
  echo '{"status":"error","message":"Cannot connect to database X"}';
  print $e->getMessage(); 
  exit();
}






