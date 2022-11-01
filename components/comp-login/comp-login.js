console.log("[COMP-LOGIN.JS]");

$("#btnLogin").on("click", function () {
  let enteredUsername = $("#txtUsername").val();
  let enteredPassword = $("#txtPassword").val();

  console.log(
    "Attempting Log In with credentials: " +
      enteredUsername +
      " / " +
      enteredPassword
  );

  $.ajax({
    url: "apis/api-login.php",
    type: "post",
    data: {
      enteredUsername: enteredUsername,
      enteredPassword: enteredPassword,
    },
  }).done(function (sData) {
    // console.log(sData);
    // let oData = JSON.parse(sData);
    oData = { status: 1 };
    console.log(oData);

    if (oData.status == 1) {
      window.location.href = "user-page.php";
      console.log("Login successful");
      // console.log(oData);
    }

    if (oData.status == 0) {
      showPopup("Error", "Database error");
      // console.log(oData);
    }

    if (oData.status == 2) {
      showPopup("Error", "Incorrect password");
      // console.log(oData);
    }

    if (oData.status == 3) {
      showPopup("Error", "User not found");
      // console.log(oData);
    }
  }); // end of .done
}); // end of .on
