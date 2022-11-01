console.log("[MAIN.JS]");

let maxDogCardDescriptionLength = 100;

function fetchHumanQuestions() {
  $.ajax({
    url: "apis/api-fetch-questions-human.php",
    type: "post",
    data: {},
  }).done(function (sData) {
    let oData = JSON.parse(sData);
    if (oData.length > 0) {
      console.log("[OK] Fetched " + oData.length + " human questions:");
      console.log(oData);
      aQuestions = oData;
      renderQuestions(oData);
    } else {
      console.log("Failed to fetch questions for humans");
      console.log(oData);
    }
  }); // end of .done
}

function renderQuestions(oQuestions) {
  $.each(oQuestions, function () {
    $("#boxQuestionsHuman").append(`
    
        <div class="questionModule" data-question-id="${this.question_id}">
            <div class="questionContent">${this.question_content_human}</div>
            <div class="questionControls">
                <div class="btn btn-question-control" data-answer-value=1><div class="buttonLabel">YES</div></div>
                
                <div class="btn btn-question-control" data-answer-value=-1><div class="buttonLabel">NO</div></div>
            </div>
        </div>
        
        `);
  });

  fetchHumanAnswers(oQuestions);
}

function fetchHumanAnswers(oQuestions) {
  var userId = $("#infoUserId").html();

  $.ajax({
    url: "apis/api-fetch-answers-human.php",
    type: "post",
    // this gives us answers only for the user that's logged in
    data: { userId: userId },
  }).done(function (sData) {
    let oData = JSON.parse(sData);

    if (oData.length > 0) {
      console.log(
        "[OK] Fetched " + oData.length + " answers for user id " + userId + ":"
      );
      console.log(oData);
      renderAnswers(oQuestions, oData);
    } else {
      console.log(oData);

      // show a popup if you have no answers recorded and you're in Matches
      if ($("#dogViewer").length > 0) {
        showPopup(
          "Welcome to Topdog!",
          "To start matching, go to 'My Profile' and fill out the form."
        );
      }

      if ($("#boxQuestionsHuman").length > 0) {
        showPopup(
          "My Profile",
          "Answer these questions and return to 'Matches' to find your top dog!"
        );
      }
    }
  }); // end of .done
}

// Render the answer highlights (callback from inside fetchHumanAnswers()
function renderAnswers(oQuestions, oAnswers) {
  // Let's create an array of DOM elements for each human question
  let aHumanQuestions = $(".questionModule");

  // For each DOM question element...
  $.each(aHumanQuestions, function (index) {
    // Take one question from the DOM
    let questionDiv = $(this);

    // Take the DOM ID of that question
    let questionDivId = $(this).attr("data-question-id");
    // console.log(questionDivId);

    // Loop through all DB answers for this user
    $.each(oAnswers, function () {
      // if the ID of the DOM div matches the JSON question_id... (array numerator irrelevant)
      if (questionDivId == $(this)[0].question_id) {
        // take the user's answer to a specific question (array numerator irrelevant)
        let userSingleAnswer = $(this)[0].user_answer;

        // take all the buttons in this specific question module
        let questionModuleButtons = questionDiv.find(".btn-question-control");

        // then for each of the buttons in a single DOM Question Module
        $.each(questionModuleButtons, function () {
          // first, clear the highlight from all the question buttons
          $(this).removeClass("btn-current-answer");

          // see what the Answer Value is for that one specific DOM button
          let btnAnswerValue = $(this).attr("data-answer-value");

          // if it's the same as user answer to that question, mark the button
          if (btnAnswerValue == userSingleAnswer) {
            $(this).addClass("btn-current-answer");
          }
        });
      }
    });
  });
}

// Give the YES/NO buttons the power to influence the DB records on click
function activateAnswerButtons() {
  $(".btn-question-control").on("click", function () {
    let answerValue = $(this).attr("data-answer-value");
    let questionId = $(this).parent().parent().attr("data-question-id");
    // changeUserAnswer(userId, questionId, answerValue);
    addAnswerHuman(userId, questionId, answerValue);
  });
}

function addAnswerHuman(userId, questionId, answerValue) {
  $.ajax({
    url: "apis/api-add-answer-human.php",
    type: "post",
    data: {
      userId: userId,
      questionId: questionId,
      answerValue: answerValue,
    },
  }).done(function (sData) {
    let oData = JSON.parse(sData);
    console.log(oData);
    fetchHumanAnswers();
  }); // end of .done
}

// for trimming the dog description text
function truncateString(input) {
  if (input.length > maxDogCardDescriptionLength)
    return input.substring(0, maxDogCardDescriptionLength) + "...";
  else return input;
}

function activateReadMoreButtons() {
  $(".btn-read-more").on("click", function () {
    // redirect with GET so users can send links to each other

    // send over the matchScore for that specific dog so you don't have to do heavy logic again later
    let dogMatchScore = $(this).parent().parent().find(".dogScore").html();
    let dogId = $(this).parent().parent().attr("data-dog-id");
    window.location.href = "dog-page.php?dogId=" + dogId;
    console.log(dogMatchScore);
  });
}

function orderDogs() {
  // console.log("========== orderDogs() ==========");

  var userId = $("#infoUserId").html();
  var matchScores = [];

  // get user's answers
  $.ajax({
    url: "apis/api-fetch-answers-human.php",
    type: "post",
    data: { userId: userId },

    // when you're .done getting the user's answers
  }).done(function (sData) {
    let oUserAnswers = JSON.parse(sData);

    // now, get all dogs' answers
    $.ajax({
      url: "apis/api-fetch-all-dog-data.php",
      type: "post",
    }).done(function (sData) {
      let oAllDogData = JSON.parse(sData);
      let numberOfDogs = 0;

      // count unique dogs
      let uniqueDogIds = [];
      $.each(oAllDogData, function (indexDogAnswer) {
        //  if the array doesn't already have this id, add it to the array
        if (!uniqueDogIds.includes(oAllDogData[indexDogAnswer].dog_id)) {
          uniqueDogIds.push(oAllDogData[indexDogAnswer].dog_id);
        }

        numberOfDogs = uniqueDogIds.length;
        // console.log("uniqueDogIds:");
        // console.log(uniqueDogIds);
      });

      // console.log("There are "+numberOfDogs+" dogs");

      $.each(uniqueDogIds, function (indexUniqueDog) {
        // matchScores[indexUniqueDog+1] = 0;
        // console.log(uniqueDogIds);
        let matchScore = { dog_id: uniqueDogIds[indexUniqueDog], score: 0 };
        matchScores.push(matchScore);
      });

      // now we have all the data we need in one async function
      // console.log(oAllDogData);
      // console.log(oUserAnswers);

      // for each dog answer
      $.each(oAllDogData, function (indexDogAnswer) {
        let activeDogId = this.dog_id;
        let activeQuestionId = this.question_id;
        let oneDogAnswer = oAllDogData[indexDogAnswer];

        // for each of the user's answers
        $.each(oUserAnswers, function (indexUserAnswer) {
          let activeUserId = this.user_id;
          let oneUserAnswer = oUserAnswers[indexUserAnswer];

          if (oneUserAnswer.question_id == oneDogAnswer.question_id) {
            // if the answers are the same, give the dog a point
            if (oneUserAnswer.user_answer == oneDogAnswer.dog_answer) {
              // console.log("Match in question " +oneUserAnswer.question_id+" between user "+oneUserAnswer.user_id+" and dog "+oneDogAnswer.dog_id);

              let targetDogId = oneDogAnswer.dog_id;
              // add points to the match score of the specific dog
              // console.log(matchScores);
              // console.log("targetDogId:"+targetDogId);

              $.each(matchScores, function (index) {
                // console.log(this);
                if (this.dog_id == targetDogId) {
                  this.score++;
                }
              });
              // matchScores[targetDogId-1].score ++;        // this line is the problem
            }
          } // end of  if oneUserAnswer
        }); // end of .each oUserAnswers
      }); // end of .each oAllDogData

      $.ajax({
        url: "apis/api-fetch-dogs.php",
        type: "post",
        data: {},
      }).done(function (sData) {
        let oData = JSON.parse(sData);
        if (oData.length > 0) {
          console.log("[OK] Fetched and ordered " + oData.length + " dogs:");
          // console.log(oData);
          // console.log(matchScores);

          // loop through each of the scores
          $.each(matchScores, function () {
            let targetDog = $(this)[0].dog_id;
            let targetDogScore = $(this)[0].score;

            // for each score, loop through the dogs and modify their object to include the score
            $.each(oData, function () {
              if ($(this)[0].dog_id == targetDog) {
                $((this.matchScore = targetDogScore));
              }
            });
          });

          // sort the oData array using a custom sorting function from main.js
          oData.sort(sortByMatchScore);
          oData.reverse();
          console.log(oData);
        } else {
          console.log("Failed to fetch dogs");
        }

        // render the dogs using a sorted array
        renderDogs(oData);
        activateReadMoreButtons();
      }); // end of .done
    }); // end of .done
  }); // end of .done
} // end of orderDogs

function renderDogs(oDogs) {
  $.each(oDogs, function (index) {
    // this code is for the dog viewer (user-page.php)
    $("#dogViewer").append(`
    
            <div class="compFrame fadeIn dogCard" data-dog-id="${this.dog_id}">

                <div class="dogPictureFrame" style="background-image:url(${
                  this.image_url
                })">
                    
                </div>

                <div class="dogDetail">
                    <div class="dogName">${this.dog_name}</div>
                    <div class="dogScore">Match level: ${this.matchScore}</div>
                    <div class="dogDescription">${truncateString(
                      this.description
                    )}</div>
                </div>
                
               
                <div class="dogCardButtons">
                    <div class="btn btn-general btn-read-more">More</div>
                    <div class="btn btn-neutral btn-add-to-favorites">♥&#xFE0E</div>
                </div>
                
            </div>
        
            `);

    // this will append the #dogScore inside #dogProfile - but only if it's an ID
    // if .dogScore is a class, that means you're in dog viewer (many dogs), and the score is rendered
    // using the code above
    if (typeof dogId != "undefined" && this.matchScore > 0) {
      // if the dogId is not undefined, and has replies, run the following

      if (dogId == this.dog_id) {
        // only for the dog where there is a match between object and dogId
        $("#dogScore").append("Match level: " + this.matchScore); // append #dogScore (works only in dog profile!)
      }
    }
  }); // end of .each
}

// this function produces a sorted array in DESCENDING matchScore order - remember to reverse it later
function sortByMatchScore(a, b) {
  var aScore = a.matchScore;
  var bScore = b.matchScore;
  return aScore < bScore ? -1 : aScore > bScore ? 1 : 0;
}

function refreshFavoriteButton(userId, dogId) {
  $.ajax({
    url: "apis/api-check-if-dog-is-favorite.php",
    type: "post",
    data: { userId: userId, dogId: dogId },
  }).done(function (sData) {
    // console.log('[AJAX] Received string data:'+ sData);
    let oData = JSON.parse(sData);

    if (oData.status == 1) {
      // dog is in favorites
      //  console.log("Dog(s) found in favorites");
      $.each($(".btn-add-to-favorites"), function () {
        let dogDOMId = $(this).parent().parent().attr("data-dog-id");
        if (dogDOMId == dogId) {
          $(this).addClass("active");
        }
      });
    } else {
      // dog is not in favorites
      // console.log("Dog(s) not found in favorites");
      $.each($(".btn-add-to-favorites"), function () {
        let dogDOMId = $(this).parent().parent().attr("data-dog-id");
        if (dogDOMId == dogId) {
          $(this).removeClass("active");
        }
      });
    }
  });
}

function activateFavoriteButtons() {
  console.log($(".btn-add-to-favorites").length);

  $(".btn-add-to-favorites").on("click", function () {
    let clickedDogId = $(this).parent().parent().attr("data-dog-id");
    toggleFavoriteStatus(userId, clickedDogId);
    refreshFavoriteButton(userId, clickedDogId);
  });
}

function toggleFavoriteStatus(userId, dogId) {
  $.ajax({
    url: "apis/api-check-if-dog-is-favorite.php",
    type: "post",
    data: { userId: userId, dogId: dogId },
  }).done(function (sData) {
    // console.log('[AJAX] Received string data:'+ sData);
    let oData = JSON.parse(sData);

    if (oData.status == 1) {
      // dog is in favorites so click removes it
      removeDogFromFavorites(userId, dogId);
    } else {
      // dog is not in favorites so click adds it
      addDogToFavorites(userId, dogId);
    }
  });
}

// this is called back from toggleFavoriteStatus()
function addDogToFavorites(userId, dogId) {
  // console.log("Adding dog "+dogId+" as favorite of user "+userId);

  $.ajax({
    url: "apis/api-add-dog-to-favorites.php",
    type: "post",
    data: { dogId: dogId, userId: userId },
  }).done(function (sData) {
    let oData = JSON.parse(sData);

    if (oData.status == 1) {
      console.log(oData);
    } else {
      console.log("[AJAX FAIL]");
    }

    refreshFavoriteButton(userId, dogId);
  });
}

// this is called back from toggleFavoriteStatus()
function removeDogFromFavorites(userId, dogId) {
  // console.log("Removing dog "+dogId+" from favorites of user "+userId);

  $.ajax({
    url: "apis/api-remove-dog-from-favorites.php",
    type: "post",
    data: { dogId: dogId, userId: userId },
  }).done(function (sData) {
    // console.log('[AJAX] Received string data:'+ sData);
    let oData = JSON.parse(sData);

    if (oData.status == 1) {
      // console.log('[AJAX OK]');
      console.log(oData);
    } else {
      console.log("[AJAX FAIL]");
    }

    refreshFavoriteButton(userId, dogId);
  });
}
