<?php include("components/comp-popup/comp-popup.php") ?>

<div id="mainRegister">

    <div id="compRegister" class="fadeIn compFrame">

        <?php include("components/comp-logotype/comp-logotype.php") ?>

        <input class="txtInput" id="txtNewUsername" placeholder="Your username" value=""></input>
        <input class="txtInput" type="password" id="txtNewPassword" placeholder="Your password" value=""></input>
        <input class="txtInput" type="password" id="txtConfirmNewPassword" placeholder="Confirm password" value=""></input>
                
        <div id="btnRegister" class="btn btn-primary"><div>REGISTER</div></div>

        <div class="btn"><a href="index.php">Log in to existing account</a></div>

    </div>

</div>
<script src="components/comp-register/comp-register.js"></script>