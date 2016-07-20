function attemptLogin() {

    var enrollment = $("#enrollment").val();
    var password = $("#password").val();

    if (enrollment === "" || password === ""){
        showAlert("alert-warning", "Campo de matrícula e/ou senha estão vazios!");
        return;
    }

    $("#loginbtn").prop("disabled", true);

    var params = {"enrollment":enrollment, "password":password};

    var request = $.ajax({
        type: "POST",
        url: "ServletLogin",
        data: params,
        dataType: "text"
    });

    request.done(function (data){

        var jsonData = JSON.parse(data);

        if(jsonData.userType !== "") {
            window.location.replace(jsonData.userType + "/home.jsp");
        }
        else{
            showAlert("alert-warning", "Matrícula e/ou senha incorretos.");
        }
    });

    request.fail(function (textStatus, errorThrown){
        showAlert("alert-danger", "The following error occurred: " + textStatus, errorThrown);
    });

    request.always(function (){
        $("#loginbtn").prop("disabled", false);
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