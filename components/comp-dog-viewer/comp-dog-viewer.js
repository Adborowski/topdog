console.log("[COMP-DOG-VIEWER.JS]");

userId = $("#infoUserId").html();

// Get dogs from the DB, including an inner join with the table of dog images
$( document ).ready(function() {

    $.ajax({

        url: "apis/api-fetch-dogs.php",
        type: "post",
        data: {
            
        },
        
    }).done(function(sData){

        let oData = JSON.parse(sData);
        if(oData.length > 0){
            console.log("[OK] Fetched "+ oData.length +" dogs:");
            console.log(oData);
            orderDogs(); // the orderDogs function also renders them
        } else {
            console.log("Failed to fetch dogs");
            // console.log(oData);
        }
        
    }) // end of .done
    
});



function fetchAllDogAnswers(){

    $.ajax({
    
        url: 'apis/api-fetch-answers-all-dogs.php',
        type: 'post',
    
    }).done(function(sData){
    
    // console.log('[AJAX] Received string data:'+ sData);
    let oData = JSON.parse(sData);
    
        if(oData.length > 0){
            console.log('[OK] Found '+oData.length+' answers for all dogs:');
            console.log(oData);
    
        } else {
            console.log('[AJAX FAIL]');
        }
    
    })
}

fetchAllDogAnswers();
fetchHumanAnswers();

// using timeout because the rendering might take some time with async js
window.setTimeout(function(){

    // make the favorite buttons clickable with logic
    activateFavoriteButtons();

    // check favorite status and refresh the buttons to reflect that status
    $.each($(".dogCard"), function(){
        let dogId = $(this).attr("data-dog-id")
        refreshFavoriteButton(userId, dogId);
    })

}, 2000);

