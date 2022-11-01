console.log("[COMP-DOG-PROFILE.JS]");

let dogId = $("#infoDogId").html();

$.ajax({
        
    url: 'apis/api-fetch-dog-profile.php',
    type: 'get',
    data: {'dogId':dogId},
    
}).done(function(sData){
    
    // console.log('[AJAX] Received string data:'+ sData);
    let oData = JSON.parse(sData);
    
    if(oData.length > 0){
        // console.log('[AJAX OK]');
        // console.log(oData[0]);
        renderDogProfile(oData);

    } else {
        console.log('[AJAX FAIL]');
    }    

});

function renderDogProfile(oDogProfile){
    console.log("[OK] Rendering dog profile object:");
    console.log(oDogProfile[0]);

    // there will always only be one, so the .each is somewhat redundant
    // I'm only using .each because I want to unlock the template literal ${}
    $.each(oDogProfile, function(){

        $("#dogProfile").append(
            `
            <div id="dogInformation">

                <div id="dogProfilePhotoFrame">
                    <img src="${this.image_url}" alt="" id="dogProfilePhoto">
                </div>
            
                <div id="dogTextInformation">
                    <div id="dogProfileName">${this.dog_name}</div>
                    <div id="dogScore"></div>
                    <div id="dogProfileDescription">
                    ${this.description}
                    </div>
                </div>

            </div>
            
               <div id="boxQuestionsDog">
                  
               </div>
            
            </div>

            <a href="user-page.php" class="btn btn-general" id="btn-dog-profile-ok">GO BACK</a>
            <div class="btn btn-general" id="btn-apply-to-adopt">APPLY TO ADOPT</div>
            `
        );
        // right after appending
        if(userLevel == 2){
            addDeleteButton();
        }

        activateAdoptButton();

    })

    
}

///////// NOW COMES A BIG COPY FROM THE HUMAN PROFILE JS

// dogId is already declared upstairs
// let dogId = $("#infoDogId").html();
var aQuestions;
var aAnswers;

// Get questions from the DB (async)
function fetchDogQuestions(){         

    $.ajax({

        url: "apis/api-fetch-questions-dog.php",
        type: "post",
        data: {
            
        },
        
    }).done(function(sData){

        let oData = JSON.parse(sData);
        if(oData.length > 0){
            // console.log("[OK] Fetched "+ oData.length +" dog questions:");
            // console.log(oData);
            aQuestions = oData;
            renderQuestions(oData);
        } else {
            console.log("Failed to fetch questions for dog profile");
            console.log(oData);
        }
        
    }) // end of .done

}

// Render the questions (callback from inside fetchHumanQuestions()
function renderQuestions(oQuestions){  

    $.each(oQuestions,function(){

        // console.log($(this));

        $("#boxQuestionsDog").append(`
    
        <div class="questionModule" data-question-id="${this.question_id}">
            <div class="questionContent">${this.question_content_dog}</div>
            <div class="questionControls">
                <div class="btn btn-question-control" data-answer-value=1><div class="buttonLabel">YES</div></div>
                
                <div class="btn btn-question-control" data-answer-value=-1><div class="buttonLabel">NO</div></div>
            </div>
        </div>
        
        `);
    
    });

    fetchDogAnswers(oQuestions, dogId);
    
};

// Get answers from the DB (async)
function fetchDogAnswers(oQuestions, dogId){

    dogId = $("#infoDogId").html();

    $.ajax({
        
        url: "apis/api-fetch-answers-dog.php",
        type: "post",
        // this gives us answers only for the dog whose profile the user is watching
        data: {"dogId":dogId},
        
    }).done(function(sData){

        // console.log("TEXT ANSWER: "+sData)
        let oData = JSON.parse(sData);
        
        if(oData.length > 0){
            console.log("[OK] Fetched "+ oData.length +" answers for dog id " + dogId+":");
            console.log(oData);
            renderAnswers(oQuestions, oData);
        
        } else {

            console.log(oData);
            
        }
        
    }) // end of .done
}

// Render the answer highlights (callback from inside fetchHumanAnswers()
function renderAnswers(oQuestions, oAnswers){

    // Let's create an array of DOM elements for each dog question
    let aDogQuestions = $(".questionModule");

    // For each DOM question element...
    $.each(aDogQuestions, function(index){

        // Take one question from the DOM
        let questionDiv = $(this);

        // Take the DOM ID of that question                       
        let questionDivId = $(this).attr("data-question-id");
        // console.log(questionDivId); 

        // Loop through all DB answers for this user
        $.each(oAnswers, function(){                     
            
            // if the ID of the DOM div matches the JSON question_id... (array numerator irrelevant)
            if (questionDivId == $(this)[0].question_id ){

                // take the user's answer to a specific question (array numerator irrelevant)
                let dogSingleAnswer = $(this)[0].dog_answer;

                // take all the buttons in this specific question module
                let questionModuleButtons = questionDiv.find(".btn-question-control");

                // then for each of the buttons in a single DOM Question Module
                $.each(questionModuleButtons,function(){
                    // first, clear the highlight from all the question buttons
                    $(this).removeClass("btn-current-answer");

                    // see what the Answer Value is for that one specific DOM button
                    let btnAnswerValue = $(this).attr("data-answer-value")

                    // if it's the same as user answer to that question, mark the button
                    if (btnAnswerValue == dogSingleAnswer){
                        $(this).addClass("btn-current-answer");
                    }
                }) 
            } 
        }) 
    })
}

let userLevel = $("#infoUserLevel").html();

// Give the YES/NO buttons the power to influence the DB records on click
// This should only happen if the user has privilegel level 2 (admin)
function activateAnswerButtons(){
    $(".btn-question-control").on("click",function(){
        let answerValue = $(this).attr("data-answer-value");
        let questionId = $(this).parent().parent().attr("data-question-id");
        dogId = $("#infoDogId").html();
        // changeUserAnswer(userId, questionId, answerValue);
        addAnswerDog(dogId, questionId, answerValue);
    })
};

// make the "Apply to Adopt" button produce a popup. In a final version it would send out an application.
function activateAdoptButton(){
    $("#btn-apply-to-adopt").on("click", function(){
        showPopup("Application sent", "Thank you for your application. Our team will get back to you with the next steps of the adoption process.")
    })
}
//
function addWarningToAnswerButtons(){

    $(".btn-question-control").on("click",function(){
        showPopup("No Access", "Sorry, only admins can edit dogs");
    });
    
}

function addDeleteButton(){

    $("#dogProfile").append(`
    <div id="btn-delete-dog" class="btn">DELETE DOG</div>
    `);

    $("#btn-delete-dog").on("click", function(){

        console.log("deleting");
        let currentDogId = $("#infoDogId").html();
        console.log(currentDogId);

        $.ajax({
        
            url: 'apis/api-delete-dog.php',
            type: 'post',
            data: {'dogId':currentDogId,}
        
        }).done(function(sData){
        
        console.log('[AJAX] Received string data:'+ sData);
        let oData = JSON.parse(sData);
        
            if(oData.status == 1){
                console.log('[AJAX OK]');
                console.log(oData);
                window.location.href = "user-page.php";
        
            } else {
                console.log('[AJAX FAIL]');
                console.log(oData);
            }
        
        })

    });

}

function addAnswerDog(dogId, questionId, answerValue){

    $.ajax({

        url: "apis/api-add-answer-dog.php",
        type: "post",
        data: {
            "dogId":dogId,
            "questionId":questionId,
            "answerValue":answerValue
        },
        
    }).done(function(sData){

        let oData = JSON.parse(sData);
        console.log(oData);
        fetchDogAnswers();
        
    }) // end of .done
}

// NOTE: these two functions have callbacks inside
$( document ).ready(function() {               

    // fetchHumanAnswers();
    fetchDogQuestions();
    orderDogs();  

    // it takes some time to render the questions and answers in the DOM 
    // so I added a 100ms delay so all the DOM elements are there when I ask for them with jQuery
    setTimeout(function(){
        if (userLevel == 2){
            // admin-only stuff
            console.log("User level is "+ userLevel +", unlocking dog profile buttons");
            activateAnswerButtons();
        } else {
            // warnings for non-admins
            addWarningToAnswerButtons();
        }
    // originally 100 below
    }, 2000);

});


