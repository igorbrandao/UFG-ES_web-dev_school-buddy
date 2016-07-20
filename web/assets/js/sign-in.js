function attemptLogin() {

    var enrollment = $("#enrollment").val();
    var password = $("#password").val();

    if (enrollment === "" || password === ""){
        showAlert("alert-warning", "Campo de matrícula e/ou senha estão vazios!");
        return;
    }

    var params = {"enrollment":enrollment, "password":password};

    var request = $.ajax({
        type: "POST",
        url: "ServletLogin",
        data: params,
        dataType: "text"
    });

    request.done(function (){
        showAlert("alert-success", "You just logged in!");
    });

    request.fail(function (textStatus, errorThrown){
        showAlert("alert-danger", "The following error occurred: " + textStatus, errorThrown);
    });

    request.always(function (){
        //Something
    });

    event.preventDefault();

}

function showAlert (alertClass, message) {

    $('#loginResult').html(
        "<div id='loginAlert' class='alert alert-dismissible " + alertClass + "' role='alert'><button type='button' class='close' data-dismiss='alert'aria-label='Close'><span aria-hidden='true'>&times;</span></button>" + message + "</div>"
    );
    $("#loginAlert").fadeTo(3000, 500).slideUp(500, function(){
        $("#loginAlert").alert('close');
    });
    userType = "";

}