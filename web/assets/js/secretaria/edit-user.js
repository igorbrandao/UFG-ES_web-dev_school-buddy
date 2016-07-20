var userType;
var userData;

var alertTexts =
{
        "notFound": "Um usuário com o número de matrícula informado não existe.",
        "bug": "Sorry, bugs happen..."
};

$(document).ready(function () {

    $('button#find').on('click', function () {
        searchUser();
    });

});

function searchUser() {

    var enrollment = $('#enrollment').val();

    if (enrollment === "") {
        showAlert("alert-warning", "emptyTitleField");
        return;
    }

    var param = {"enrollment":enrollment};

    var request = $.ajax({
        type: "POST",
        url: "ServletGetUser",
        data: param,
        dataType: "text"
    });

    request.done(function (data){

        userData = JSON.parse(data);

        if (!userData) {
            showAlert("notFound", "alert-warning");
        }
        else {
            userType = userData.type;
            var userModal = $('#edit-' + userType);

            userModal.find(".modal-title").html("Editando " + userType + " " + userData.enrollment + ".");
            for (var i = 0; i < Object.keys(userData).length; i++){
                var currentKey = Object.keys(userData)[i];
                $("#" + currentKey + "-" + userType).val(userData[currentKey]);
            }
            alertTexts.update = "Os dados do " + userType + " de matrícula " + userData.enrollment + " foram alterados.";
            alertTexts.delete = "O " + userType + " de matrícula " + userData.enrollment + " foi apagado.";

            userModal.modal('toggle');
        }

    });

    request.fail(function (textStatus, errorThrown){
        showAlert("alert-danger", "The following error occurred: " + textStatus, errorThrown);
    });

    event.preventDefault();

}

function showAlert (alertType, alertClass) {
    $('#queryResult').html(
        "<div id='queryAlert' class='alert alert-dismissible " + alertClass + "' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>" + alertTexts[alertType] + "</div>"
    );
	$("#queryAlert").fadeTo(3000, 500).slideUp(500, function(){
   		$("#queryAlert").alert('close');
	});
    userType = "";
}