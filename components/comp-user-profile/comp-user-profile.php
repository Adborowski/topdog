<script src="components/comp-user-profile/comp-user-profile.js"></script>

<div class="frameHeadline">
    Your profile
</div>

<div id="frameUserProfileEditor">

    <div class="userProfileModule">
        <div class="moduleLabel">Your full name</div>
        <?php echo '<input type="text" id="userFullName" value="'.$_SESSION["activeUserFullName"].'">' ?>
    </div>

    <div class="userProfileModule">
        <div class="moduleLabel">Your email</div>
        <?php echo '<input type="text" id="userEmail" value="'.$_SESSION["activeUserEmail"].'">' ?>
    </div>

    <div class="userProfileModule">
        <div class="moduleLabel">Your phone number</div>
        <?php echo '<input type="text" id="userPhoneNumber" value="'.$_SESSION["activeUserPhoneNumber"].'">' ?>
    </div>

    <div class="userProfileControls">
        <div class="btn btn-general" id="btn-user-profile-save">SAVE</div>
    </div>

</div>

<script src="components/comp-user-profile/comp-user-profile.js"></script>