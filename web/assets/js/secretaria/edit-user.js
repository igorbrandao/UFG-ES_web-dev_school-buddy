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
        "name": "Ashley Jacobs",
        "email": "email2@domain2.com",
        "address": "AVENIDA 85, 759 - QD F-24 - LT 91 - ED. FELICIDADE / SETOR SUL - GOIÂNIA CEP: 74080-010",
        "phone": "(62)98712-3840",
        "age": "14"
};

var mockedTeacher =
{
        "enrollment": "201261",
        "name": "Aaron Butler",
        "email": "email5@domain5.com",
        "address": "AVENIDA 85, 759 - QD F-24 - LT 91 - ED. FELICIDADE / SETOR SUL - GOIÂNIA CEP: 74080-010",
        "phone": "(62)98712-3840",
        "age": "38",
        "areas": "Português, Matemática"
};

var mockedResponsible =
{
        "enrollment": "301259",
        "name": "Audrey Ann",
        "email": "email3@domain3.com",
        "address": "AVENIDA 85, 759 - QD F-24 - LT 91 - ED. FELICIDADE / SETOR SUL - GOIÂNIA CEP: 74080-010",
        "phone": "(62)98712-3840",
        "age": "31",
        "entes": "101258, 101259",
        "op": "Google",
        "ap": "Designer"
};

$(document).ready(function () {

    $('button#find').on('click', function () {
        mockSearch();
        $(this).attr('data-target', '#edit' + userType);
    });

});

function mockSearch() {

    //Simula encontrar um usuário para editar ou não, o que seria o resultado de
    //var userData = backend.getUserByEnrollmentNumber(searchField.value) !== undefined

    var chance = Math.random();

    if ( chance <= 0.25 ) {
        userData = mockedStudent;
    }
    else if ( chance > 0.25 && chance <= 0.5 ) {
        userData = mockedTeacher;
    }
    else if ( chance > 0.5 && chance <= 0.75 ) {
        userData = mockedResponsible;
    }
    else {
        showAlert("notFound", "alert-warning");
    }
    if ( chance <= 0.75 ) {
        userType = getUserType();
        $('#edit' + userType).find("#editModalTitle").html("Editando " + userType + " " + userData.enrollment + ".");
        for (i = 0; i < Object.keys(userData).length; i++){
            var currentKey = Object.keys(userData)[i];
            $("input#" + currentKey).val(userData[currentKey]);
        }
        //$("#formID").val(userData.fieldValue);
        alertTexts.update = "Os dados do " + userType + " de matrícula " + userData.enrollment + " foram alterados.";
        alertTexts.delete = "O " + userType + " de matrícula " + userData.enrollment + " foi apagado.";
    }
}

function getUserType(){
    if (userData.enrollment.substr(0,2) == 10) {
        return "Aluno";
    }
    else if (userData.enrollment.substr(0,2) == 20) {
        return "Professor";
    }
    else if (userData.enrollment.substr(0,2) == 30) {
        return "Responsavel";
    }
    else {
        showAlert("bug", "alert-danger");
    }
}

function showAlert (alertType, alertClass) {
    $('#queryResult').html(
        "<div id='queryAlert' class='alert alert-dismissible " + alertClass + "' role='alert'><button type='button' class='close' data-dismiss='alert'aria-label='Close'><span aria-hidden='true'>&times;</span></button>" + alertTexts[alertType] + "</div>"
    );
	$("#queryAlert").fadeTo(3000, 500).slideUp(500, function(){
   		$("#queryAlert").alert('close');
	});
    userType = "";
}
