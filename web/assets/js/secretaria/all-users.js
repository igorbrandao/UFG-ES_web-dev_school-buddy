var updatingUserID;
var deletingUserID;
var userModal;
var userType;

var alertTexts =
{
    "bug": "Sorry, bugs happen..."
};

$(document).ready(function () {

    $('.btn-filter').on('click', function () {
        var $target = $(this).data('target');
        if ($target != 'all') {
            $('.table tr').css('display', 'none');
            $('.table tr[data-status=all]').fadeIn('slow');
            $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
        } else {
            $('.table tr[data-status=all]').fadeIn('slow');
            $('.table tr').css('display', 'none').fadeIn('slow');
        }
    });

    $('#usersTable').delegate('.glyphicon-pencil', 'click', function () {
        var editingRow = $('table#usersTable').find('tbody').find('tr#' + $(this).attr('id'));
        userData =
        {
            //Todos valores vem do backend dinamicamente dependendo do tipo de usuário
            "enrollment": $(editingRow).find('td:eq(0)').html(),
            "name": $(editingRow).find('td:eq(2)').html(),
            "email": $(editingRow).find('td:eq(3)').html(),
            "address": "AVENIDA 85, 759 - QD F-24 - LT 91 - ED. FELICIDADE / SETOR SUL - GOIÂNIA CEP: 74080-010",
            "phone": "(62)98712-3840",
            "age": "19"
        };
        userType = getUserType();
        userModal = $('#edit' + userType);
        updatingUserID = userData.enrollment;
        alertTexts.update = "Os dados do " + userType + " de matrícula " + userData.enrollment + " foram alterados.";
        $(userModal).find("#editModalTitle").html("Editando " + userType + " " + userData.enrollment + ".");
        for (i = 0; i < Object.keys(userData).length; i++){
            var currentKey = Object.keys(userData)[i];
            $("input#" + currentKey).val(userData[currentKey]);
        }
        //$("#formID").val(userData.fieldValue);
    });

    $('#usersTable').delegate('.glyphicon-remove', 'click', function () {
        var deletingRow = $('table#usersTable').find('tbody').find('tr#' + $(this).attr('id'));
        userData =
        {
            "enrollment": $(deletingRow).find('td:eq(0)').html(),
            "name": $(deletingRow).find('td:eq(2)').html(),
            "email": $(deletingRow).find('td:eq(3)').html(),
        };
        userType = getUserType();
        deletingUserID = userData.enrollment;
        alertTexts.delete = "O " + userType + " de matrícula " + userData.enrollment + " foi apagado.";
        $("#deleteModalTitle").html("Atenção! Deletando Usuário " + userData.enrollment + ".");
        $("#deletingUserInfo").html("<b>Nome: </b>" + userData.name + "<br>" + "<b>Email: </b>" + userData.email + ".");
    });

 });

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

function updateUser () {
    $('table#usersTable').find('tbody').find('#' + updatingUserID).html(
        "<td>" + userData.enrollment + "</td>" +
        "<td>" + userType + "</td>" +
        "<td>" + $(userModal).find("input#name").val() + "</td>" +
        "<td>" + $(userModal).find("input#email").val() + "</td>" +
        "<td>" +
            "<a href='#edit" + userType + "' role='button' data-toggle='modal'><i id='" + updatingUserID + "' class='glyphicon glyphicon-pencil'></i></a>" +
            "<a href='#deleteUser' role='button' data-toggle='modal'><i id='" + updatingUserID + "' class='glyphicon glyphicon-remove'></i></a>" +
        "</td>"
    );
    showAlert("update", "alert-success");
}

function deleteUser () {
    $('table#usersTable').find('tbody').find('#' + deletingUserID).html("");
    showAlert("delete", "alert-info");
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
