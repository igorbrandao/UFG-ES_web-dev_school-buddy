var currentPage;
var userType;
var users;

var alertTexts =
{
    "bug": "Sorry, bugs happen..."
};

$(document).ready(function () {

    currentPage = 1;
    users = [];

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
        userData = users[editingRow];
        userType = userData.type;
        alertTexts.updated = "Os dados do " + userType + " de matrícula " + userData.enrollment + " foram alterados.";
        $('#editModalTitle-' + userType).html("Editando " + userType + " " + userData.enrollment + ".");
        for (var i = 0; i < Object.keys(userData).length; i++){
            var currentKey = Object.keys(userData)[i];
            $("input#" + userType + "-" + currentKey).val(userData[currentKey]);
        }
        //$("#formID").val(userData.fieldValue);
    });

    $('#usersTable').delegate('.glyphicon-remove', 'click', function () {
        var deletingRow = $('table#usersTable').find('tbody').find('tr#' + $(this).attr('id'));
        userData = users[deletingRow];
        userType = userData.type;
        alertTexts.deleted = "O " + userType + " de matrícula " + userData.enrollment + " foi apagado.";
        $("#deleteModalTitle").html("Atenção! Deletando Usuário " + userData.enrollment + ".");
        $("#deletingUserInfo").html("<b>Nome: </b>" + userData.name + "<br>" + "<b>Email: </b>" + userData.email + ".");
    });

    listUsers(currentPage);

 });

function updateUser () {

    var map = {};
    $('#edit-' + userType + ' :input').each(function() {
        map[$(this).attr("id")] = $(this).val();
    });

    function formHasEmptyFields(map) {
        for (var i = 0; i < Object.keys(map).length; i++) {
            var currentKey = Object.keys(map)[i];
            if (map[currentKey] === "") {
                return true;
            }
        }
        return false;
    }

    if (formHasEmptyFields(map)) {
        showAlert("alert-warning", "Todos os campos do formulário são obrigatórios.");
        return;
    }
    if(map["password"] != map["repeatPassword"]){
        showAlert("alert-warning", "As senhas não correspondem.");
        return;
    }

    window.alert("Before: " + map["type"]);
    map["type"] = map["type"].toLowerCase();
    window.alert("After: " + map["type"]);

    var request = $.ajax({
        type: "POST",
        url: "ServletUpdateUser",
        data: map,
        dataType: "text"
    });

    request.done(function (){
        listUsers(currentPage);
        showAlert("updated", "alert-success");
    });

    request.fail(function (textStatus, errorThrown){
        showAlert("", "alert-danger", "The following error occurred: " + textStatus, errorThrown);
    });

    request.always(function (){
        //Something
    });

    event.preventDefault();
}

function deleteUser () {

    var request = $.ajax({
        type: "POST",
        url: "ServletDeleteUser",
        data: "enrollment: " + userData.enrollment,
        dataType: "text"
    });

    request.done(function (){
        listUsers(currentPage);
        showAlert("deleted", "alert-info");
    });

    request.fail(function (textStatus, errorThrown){
        showAlert("", "alert-danger", "The following error occurred: " + textStatus, errorThrown);
    });

    request.always(function (){
        //Something
    });

    event.preventDefault();
}

function buildPagination(usersPageCount) {

    var disable;
    var active;

    if(currentPage-1 === 0){disable = "class='disabled'";} else{disable = "";}
    var paginationHTML = "" +
        "<li>" +
            "<a "+disable+" href='#' onclick='listUsers("+(++currentPage)+")' aria-label='Previous'>" +
                "<span aria-hidden='true'>&laquo;</span>" +
            "</a>" +
        "</li>";

    for (var i = 1; i <= usersPageCount; i++) {
        if(i === currentPage){active = "class='active'";} else{active = "";}
        paginationHTML += "<li><a "+active+" href='#' onclick='listUsers("+i+")'>" + i + "</a></li>";
    }

    if(currentPage+1 === usersPageCount){disable = "class='disabled'";} else{disable = "";}
    paginationHTML += "" +
        "<li>" +
            "<a "+disable+" href='#' onclick='listUsers("+(--currentPage)+")' aria-label='Next'>" +
                "<span aria-hidden='true'>&raquo;</span>" +
            "</a>" +
        "</li>";

    $('.pagination').html(paginationHTML);

}

function listUsers(pageNumber) {

    $.getJSON("ServletCountUsers", {}, function (data) {
        buildPagination(data);
    });

    $.getJSON("ServletListUsers?page=" + pageNumber, {}, function (data) {
        
        users = data;

        var tableHTML = "";

        for (var x = 0; x < users.length; x++) {

            var currentUser = users[x];

            tableHTML += "" +
                "<tr data-status='" + currentUser.type + "' id='"+x+"'> " +
                    "<td>" + currentUser.enrollment + "</td>" +
                    "<td>" + currentUser.type + "</td>" +
                    "<td>" + currentUser.name + "</td>" +
                    "<td>" + currentUser.email + "</td>" +
                    "<td>" +
                        "<a href='#editAluno' role='button' data-toggle='modal'><i id='editUser"+x+"' class='glyphicon glyphicon-pencil'></i></a>" +
                        "<a href='#deleteUser' role='button' data-toggle='modal'><i id='deleteUser"+x+"' class='glyphicon glyphicon-remove'></i></a>" +
                    "</td>" +
                "</tr>";

            console.log(users[x]);
        }

        $('table#usersTable').find('tbody').html(tableHTML);

    });

}

function showAlert (alertType, alertClass, message) {

    if(!message){
        message = "";
    }

    $('#queryResult').html(
        "<div id='queryAlert' class='alert alert-dismissible " + alertClass + "' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>" + alertTexts[alertType] + " " + message + "</div>"
    );
    $("#queryAlert").fadeTo(3000, 500).slideUp(500, function(){
        $("#queryAlert").alert('close');
    });
    userType = "";
    
}