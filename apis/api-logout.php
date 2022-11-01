<?php

session_start();
unset($_SESSION["activeUsername"]);
unset($_SESSION["activePassword"]);
session_destroy();

if(empty($_SESSION["activeUsername"])){
    echo('{"status":1, "message": "Logout Successful"}');
}

?>