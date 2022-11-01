<?php include "header.php" ?>

<?php include "components/comp-navigation/comp-navigation.php" ?>

<div class="infoPixel" id="infoDogId"><?php echo($_GET["dogId"])?></div>

<?php 

// var_dump($_POST);

?>


<?php include "components/comp-dog-profile/comp-dog-profile.php"?>

<?php include "footer.php" ?>