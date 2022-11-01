console.log("[COMP-POPUP.JS]");

$("#btn-popup-ok").on("click", function(){
    hidePopup();
})

function showPopup(popupTitle, popupContent){

    // console.log("Showing popup");
    $("#popupModal").css("opacity", 1).css("z-index", 500);
    $("#popupTitle").html(popupTitle);
    $("#popupContent").html(popupContent);

}

// showPopup("Test Title", "Test Content");

function hidePopup(){
    $("#popupModal").css("opacity", 0).css("z-index", -500);
}

// if you're a new user and your match scores are 0