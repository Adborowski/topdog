console.log("[COMP-REGISTER.JS");

function checkIfPasswordsMatch(){

    //we check if the entered passwords match
    if ($("#txtNewPassword").val() !== $("#txtConfirmNewPassword").val()){

        // console.log("Passwords don't match, aborting registration");
        return(false);

    // this happens if they do match
    } else {

        // console.log("Passwords match, allowing registration");
        return(true);

    }
}

$("#btnRegister").on("click", function(){

    console.log("Trying to register new user...");
   
        let enteredNewUsername = $("#txtNewUsername").val();
        let enteredNewPassword = $("#txtNewPassword").val();

        console.log("Passwords match status: "+checkIfPasswordsMatch());

        // only make the ajax call if the passwords match
        if (checkIfPasswordsMatch() == true){

            $.ajax({

                url: "apis/api-register.php",
                type: "post",
                data: {
                    "newUsername": enteredNewUsername,
                    "newPassword": enteredNewPassword
                },
                
            }).done(function(sData){

                    console.log(sData);
                    let oData = JSON.parse(sData);
                    if (oData.status == 1){
                        window.location.href = "user-page.php";
                    } 

                    if (oData.status == 0){
                        showPopup("Error", "Failed to register")
                    }

                    // if (sData.length > 100){
                    if (oData.status == 2){
                        showPopup("Error", "Username already exists")
                    }

                    if (oData.status == 3){
                        showPopup("Error", "Password must be longer than "+oData.minLength+" characters.");
                    }

                    if (oData.status == 4){
                        showPopup("Error", "Username cannot be empty");
                    }

                    console.log(oData);
                
            }) // end of .done

        } else {
            showPopup("Error", "Passwords don't match");
        } // end of if CheckPasswords

}); // end of .on