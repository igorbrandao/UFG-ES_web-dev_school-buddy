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
        alertTexts.update = "Os dados do " + userType + " de matrícula " + userData.enrollment + " foram alterados.";
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
        alertTexts.delete = "O " + userType + " de matrícula " + userData.enrollment + " foi apagado.";
        $("#deleteModalTitle").html("Atenção! Deletando Usuário " + userData.enrollment + ".");
        $("#deletingUserInfo").html("<b>Nome: </b>" + userData.name + "<br>" + "<b>Email: </b>" + userData.email + ".");
    });

 });

function updateUser () {

    listUsers(currentPage);
    showAlert("update", "alert-success");
}

function deleteUser () {

    listUsers(currentPage);
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


function buildPagination(usersPageCount) {

    var disable;
    var active;

    if(currentPage-1 === 0){disable = "class='disabled'";} else{disable = "";}
    var paginationHTML = "" +
        "<li>" +
            "<a "+disable+" href='#' onclick='listUsers("+(currentPage-1)+")' aria-label='Previous'>" +
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
            "<a "+disable+" href='#' onclick='listUsers("+(currentPage+1)+")' aria-label='Next'>" +
                "<span aria-hidden='true'>&raquo;</span>" +
            "</a>" +
        "</li>";

    $('.pagination').html(paginationHTML);

}

function listUsers(pageNumber) {

    if(!pageNumber){
        pageNumber = currentPage;
    }

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

//TODO: Refactor to fit context.

function updateGame() {

    var newTitle = $('#newTitle').val();
    var newCategory = $('#newCategory').val();
    var newPrice = $('#newPrice').val();

    if (newTitle === "" || newCategory === "" || newPrice === "") {
        showAlert("alert-warning", "emptyUpdateFields");
        return;
    }
    if (parseInt(newPrice) > 0){
        showAlert("alert-warning", "negativeUpdatePrice");
        return;
    }
    $.ajax({
        dataType: "text",
        url: "UpdateGame?" +
        "newTitle=" + newTitle +
        "&newCategory=" + newCategory +
        "&newPrice=" + newPrice +
        "&updatingGameId=" + updatingGameId,
        success: function () {
            showAlert("alert-success", "updatedGame");
            updatingGameId = {};
        }
    });
}

function deleteGame() {

    $.ajax({
        dataType: "text",
        url: "DeleteGame?" +
        "&deletingGameId=" + deletingGameId,
        success: function () {
            showAlert("alert-info", "deletedGame");
            deletingGameId = {};
        }
    });

}