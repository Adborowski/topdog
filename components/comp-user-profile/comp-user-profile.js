console.log("[COMP-USER-PROFILE.JS]");



$("#btn-user-profile-save").on("click", function(){

    let editedFullName = $("#userFullName").val();
    let editedEmail = $("#userEmail").val();
    let editedPhoneNumber = $("#userPhoneNumber").val();

    console.log(editedFullName);
    console.log(editedEmail);
    console.log(editedPhoneNumber);
    editUserProfile(editedFullName, editedEmail, editedPhoneNumber);
})

function editUserProfile(editedFullName, editedEmail, editedPhoneNumber){

    $.ajax({

        url: 'apis/api-edit-user-profile.php',
        type: 'post',
        data: { 'editedFullName':editedFullName,
                'editedEmail':editedEmail,
                'editedPhoneNumber':editedPhoneNumber,
        },
    
    }).done(function(sData){
    
        console.log('[AJAX] Received string data:'+ sData);
        // let oData = JSON.parse(sData);
    
        //     if(oData.length > 0){
        //         console.log('[AJAX OK]');
        //         console.log(oData);
    
        //     } else {
        //         console.log('[AJAX FAIL]');
        //     }
    
    })

}



