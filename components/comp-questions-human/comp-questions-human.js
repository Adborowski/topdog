console.log("[COMP-QUESTIONS-HUMAN.JS]");

var userId = $("#infoUserId").html();
var aQuestions;
var aAnswers;

// NOTE: these two functions have callbacks inside
$( document ).ready(function() {               

    fetchHumanQuestions();  

    // it takes some time to render the questions and answers in the DOM 
    // so I added a 100ms delay so all the DOM elements are there when I ask for them
    // THIS NEEDS A REWORK
    setTimeout(function(){
        activateAnswerButtons();
    }, 2000);

});