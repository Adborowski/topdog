console.log("[COMP-VIDEO-BROWSER.JS]");

// Get videos from the DB
$( document ).ready(function() {

    $.ajax({

        url: "apis/api-fetch-videos.php",
        type: "post",
        data: {
            
        },
        
    }).done(function(sData){

        let oData = JSON.parse(sData);
        if(oData.length > 0){
            console.log("[OK] Fetched "+ oData.length +" videos:");
            console.log(oData);
            renderVideos(oData);
        } else {
            console.log("Failed to fetch videos");
            // console.log(oData);
        }
        
    }) // end of .done
    
});

function renderVideos(oVideos){
    console.log("Rendering videos");

    $.each(oVideos, function(index){

        // console.log(this);
        $("#videoBrowser").append(`
        
        <div class="fadeIn videoCard" data-video-id=${this.video_id}>

            <div class="videoFrame">
                <iframe 
                    width="560" 
                    height="315" 
                    src=${this.video_url}
                    frameborder="0" 
                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
                    allowfullscreen>
                </iframe>
            </div>

            <div class="videoDetail">
                <div class="videoTitle">${this.video_title}</div>
                <div class="videoDescription">${this.video_description}</div>
            </div>
        
        </div>

        `)

    });

    
}