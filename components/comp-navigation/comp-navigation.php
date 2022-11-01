<?php if(!isset($_SESSION)){session_start();}?>

<?php 
if (!empty($_SESSION["activeUsername"])) {
    
} else {
    // echo "NOT LOGGED IN!";
    echo "<div id='messageCard'>You are not logged in. Please log in <a href='index.php'>here</a> </div>";
    die;
};

// var_dump($_SESSION);

?>

<div id="navigationDesktop">

    <div class="moduleNavDesktop">
        <?php include("components/comp-logotype/comp-logotype.php"); ?>
    </div>

    <div class="moduleNavDesktop info">
        <div class="navInfoBox">Hello, <?php echo($_SESSION["activeUsername"]) ?> </div>    
        <div class="infoPixel" id="infoUserId"><?php echo($_SESSION["activeUserId"])?></div>    
        <div class="infoPixel" id="infoUserLevel"><?php echo($_SESSION["activeUserLevel"])?></div>    
    </div>

    <div class="moduleNavDesktop">
        <a href="user-page.php" class="btn btn-primary">Matches</a>
    </div>

    <div class="moduleNavDesktop">
        <a href="favorites.php" class="btn btn-primary">Favorites</a>
    </div>

    <div class="moduleNavDesktop">
        <a href="my-profile.php" class="btn btn-primary">My profile</a>
    </div>

    <div class="moduleNavDesktop">
        <a href="add-dog.php" class="btn btn-primary">Add dog</a>
    </div>

    <div class="moduleNavDesktop">
        <a href="knowledge.php" class="btn btn-primary">Knowledge</a>
    </div>

    <div class="moduleNavDesktop">
        <div id="btnLogout" class="btn btn-primary">Log Out</div>
    </div>

</div>

<div id="btnBurger">
    <div id="burgerIcon">☰</div>
</div>

<div id="navigationMobile" class="open">
    <a href="user-page.php" class="btn btn-general moduleNavMobile">Matches</a>
    <a href="favorites.php" class="btn btn-general moduleNavMobile">Favorites</a>
    <a href="my-profile.php" class="btn btn-general moduleNavMobile">My Profile</a>
    <a href="add-dog.php" class="btn btn-general moduleNavMobile">Add Dog</a>
    <a href="knowledge.php" class="btn btn-general moduleNavMobile">Knowledge</a>
    <div class="btn btn-general moduleNavMobile" id="btnLogoutMobile" >Log Out</div>
</div>

<?php include("components/comp-popup/comp-popup.php"); ?>

<script src="components/comp-navigation/comp-navigation.js"></script>
