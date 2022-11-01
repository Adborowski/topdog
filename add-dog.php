<?php include "header.php" ?>

<?php include "components/comp-navigation/comp-navigation.php" ?>

<?php 

if ($_SESSION["activeUserLevel"] != 2){
    echo '<div id="messageCard">This feature is admin-only. Sorry!</div>';
} else {
    include "components/comp-add-dog/comp-add-dog.php";
}
?>

<?php include "footer.php" ?>

