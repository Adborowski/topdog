console.log("[COMP-NAVIGATION.JS]");

// LOG OUT CODE

$("#btnLogout, #btnLogoutMobile").on("click", function(){

    $.ajax({

        url: "apis/api-logout.php",
        type: "post"
        
    }).done(function(sData){

        let oData = JSON.parse(sData);
        if(oData.status == 1){
            window.location.href = "index.php";
            console.log("Logout successful");
        } else {
            console.log("Failed to Logout");
        }
        
    }) // end of .done

}) // end of .on

// END OF LOG OUT CODE

var isMobileMenuFolded = true;
var mobileMenuHeight = $("#navigationMobile").css("height");
// console.log(mobileMenuHeight);

function toggleMobileMenu(){

    if (isMobileMenuFolded == true){
        console.log("Unfolding...");
        $("#navigationMobile").css("top", "0px")
        isMobileMenuFolded = !isMobileMenuFolded;
        $("#burgerIcon").css("color", "white");
    } else {
        console.log("Folding...");
        $("#navigationMobile").css("top", "-100vh")
        isMobileMenuFolded = !isMobileMenuFolded;
        $("#burgerIcon").css("color", "inherit");
    }

}

$("#btnBurger").on("click", function(){
    toggleMobileMenu();
})

// // fade out anything that had been faded in, then navigate
// // THIS IS EXPERIMENTAL AND OPTIONAL AND SO IS THE .FADEIN CLASS
// $("a").on("click", function(e){
//     e.preventDefault();
//     let destinationUrl = $(this).attr("href");
//     console.log(destinationUrl);
//     $(".fadeIn").removeClass("fadeIn").addClass("fadeOut");

//     window.setTimeout(function(){
//         console.log("navigating to " + destinationUrl);
//         window.location = destinationUrl;
//     }, 100);
// })

function highlightNavigation(){

    var currentUrl = window.location.pathname;
    var trimmedUrl = currentUrl.replace("/dogs/", "");
    
    // console.log(trimmedUrl);
    $.each($(".moduleNavDesktop"), function(){

        let thisNavigationButtonLink = $(this).find("a").attr("href");
        if (trimmedUrl == thisNavigationButtonLink){
            // console.log(thisNavigationButtonLink);
            $(this).find("a").addClass("active");
        }
    })

}

highlightNavigation();