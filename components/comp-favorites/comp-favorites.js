console.log("[COMP-FAVORITES.JS]");

let userId = $("#infoUserId").html();

fetchFavoriteDogs();

function fetchFavoriteDogs(){

    $.ajax({

        url: 'apis/api-fetch-favorites.php',
        type: 'post',
        data: {'userId':userId}
    
    }).done(function(sData){
    
    // console.log('[AJAX] Received string data:'+ sData);
    let oData = JSON.parse(sData);
    
        if(oData.length > 0){
            console.log('[AJAX OK]');
            console.log(oData);
            // render all dogs first, ordered
            orderDogs();
            // and then we'll remove those who aren't favorite
            keepOnlyFavoriteDogs(oData);
            
    
        } else {
            console.log(oData);
            $("#dogViewer").css("grid-template-columns", "1fr").append(`
            <div id="messageCard">You don't have any favorites! Go to 'Matches' to make some.</div>
            `);
        }
    
    });

}

// NOTE! IN THE SCSS FOR THIS COMPONENT, .DOGCARD'S DISPLAY IS SET TO NONE TO AVOID FLASHING!
// NOTE! IN THE SCSS FOR THIS COMPONENT, .DOGCARD'S DISPLAY IS SET TO NONE TO AVOID FLASHING!
// NOTE! IN THE SCSS FOR THIS COMPONENT, .DOGCARD'S DISPLAY IS SET TO NONE TO AVOID FLASHING!

function keepOnlyFavoriteDogs(oFavoriteDogs){

    // since this function targets DOM elements, it must run in a timeout to wait for async
    window.setTimeout(function(){

        // first, undisplay all the cards
        $.each($(".dogCard"), function(){
            $(this).css("display", "none");
        });

        // this is gonna happen for each dog object in the Favorite Dogs array
        $.each(oFavoriteDogs, function(){

            let favoriteDogId = $(this)[0].dog_id

            $.each($(".dogCard"), function(){
                let cardDogId = $(this).attr("data-dog-id");

                if (favoriteDogId == cardDogId){
                    console.log("Dog id "+favoriteDogId+" is in favorites, keeping");
                    $(this).css("display", "grid");
                }
            })
        });

        // make the favorite buttons clickable with logic
        activateFavoriteButtons();

        // check favorite status and refresh the buttons to reflect that status
        $.each($(".dogCard"), function(){
            let dogId = $(this).attr("data-dog-id")
            refreshFavoriteButton(userId, dogId);
        })

        // remove card from the DOM if it's favorite, and you click the favorite button, removing it
        $(".btn-add-to-favorites").on("click",function(){
            if($(this).hasClass("active")){
                $(this).parent().parent().css("display", "none");
            }
            
        })

    },1000) // end of setTimeout

}