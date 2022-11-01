console.log("[COMP-ADD-DOG.JS]");

$("#btn-submit-new-dog").on("click", function(e){

    e.preventDefault();
    
    var form = $('form')[0];
    var formData = new FormData(form); 
    // console.log(formData);

    $.ajax({
    
        url: 'apis/api-add-dog.php',
        type: 'post',
        data: formData,
        contentType: false, // Not sure what this does but the spec says it's necessary
        processData: false, // Not sure what this does but the spec says it's necessary
        
    }).done(function(sData){
    
    console.log('[AJAX] Received string data:'+ sData);
    let oData = JSON.parse(sData);
    console.log(oData);

    if (oData.status == 1){
        console.log("Redirecting to dog page with id:" + oData.dog_id);
        window.location.href = "dog-page.php?dogId="+oData.dog_id;
// dogs/dog-page.php?dogId=55
// http://localhost:8888/dogs/dog-page.php?dogId=31
    }
    
    })
})

document.getElementById("newDogImage").onchange = function () {
    console.log("Change detected in image uploader");
    var reader = new FileReader();

    $("#imagePreviewFrame").css("width", "250px").css("height", "250px");

    reader.onload = function (e) {
        // get loaded data and render thumbnail.
        document.getElementById("previewImg").src = e.target.result;
    };
    // read the image file as a data URL.
    reader.readAsDataURL(this.files[0]);
};