function sendOTP() {
    var contactInfo = document.getElementById("contactInfo").value.trim();

    if (contactInfo === "") {
        alert("Please enter an email first.");
        return;
    }


    $.ajax({
        type: "POST",
        url: "ForgotPassword?action=sendOTP",
        data: $("#forgotPasswordForm").serialize(),
        success: function (response) {
            console.log(response);
        },
        error: function (error) {
            console.log(error);
        }
    });
}

function getNewPasswrod() {
    var contactInfo = document.getElementById("contactInfo").value.trim();
    var otp = document.getElementById("otpCode").value.trim();

    alert("New password was sending to your email: " + contactInfo+". Check it to get new password.");

    $.ajax({
        type: "POST",
        url: "ForgotPassword?action=getNewPassword",
        data: $("#forgotPasswordForm").serialize(),
        success: function (response) {
            console.log(response);
        },
        error: function (error) {
            console.log(error);
        }
    });
}