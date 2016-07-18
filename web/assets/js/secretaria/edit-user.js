var userType;
var userData;

var alertTexts =
{
        "notFound": "Um usuário com o número de matrícula informado não existe.",
        "bug": "Sorry, bugs happen..."
};

var mockedStudent =
{
        "enrollment": "101258",
        "type": "aluno",
        "email": "email2@domain2.com",
        "hash": "md5hash1",
        "name": "Ashley Jacobs",
        "address": "AVENIDA 85, 759 - QD F-24 - LT 91 - ED. FELICIDADE / SETOR SUL - GOIÂNIA CEP: 74080-010",
        "phone": "(62)98712-3840"
};

var mockedTeacher =
{
        "enrollment": "201261",
        "type": "professor",
        "email": "email5@domain5.com",
        "hash": "md5hash2",
        "name": "Aaron Butler",
        "address": "AVENIDA 85, 759 - QD F-24 - LT 91 - ED. FELICIDADE / SETOR SUL - GOIÂNIA CEP: 74080-010",
        "phone": "(62)98712-3840",
        "areas": ["Português", "Matemática"]
};

$(document).ready(function () {

    $('button#find').on('click', function () {
        searchUser();
        $(this).attr('data-target', '#edit' + userType);
    });

});

function searchUser() {

    var enrollment = $('#enrollment').val();

    if (enrollment === "") {
        showAlert("alert-warning", "emptyTitleField");
        return;
    }

    $.getJSON("ServletFindUser?enrollment=" + enrollment, {}, function (data) {
        userData = data;
        console.log("search complete");
    });

    if (!userData) {
        showAlert("notFound", "alert-warning");
    }
    else {
        userType = userData.type;
        $('#edit' + userType).find("#editModalTitle").html("Editando " + userType + " " + userData.enrollment + ".");
        for (var i = 0; i < Object.keys(userData).length; i++){
            var currentKey = Object.keys(userData)[i];
            $("input#" + currentKey).val(userData[currentKey]);//$("#formID").val(userData.fieldValue);
        }
        alertTexts.update = "Os dados do " + userType + " de matrícula " + userData.enrollment + " foram alterados.";
        alertTexts.delete = "O " + userType + " de matrícula " + userData.enrollment + " foi apagado.";
    }
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