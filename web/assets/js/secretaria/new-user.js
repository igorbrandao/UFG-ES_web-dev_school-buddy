function switchForm (formValue) {
	$('#create').prop('disabled', false);
	document.getElementById("type").value = formValue;
	document.getElementById("create").className = "btn btn-info";
	document.getElementById("forms").innerHTML = commonForms() + specificForms(formValue);
}

function commonForms(){
	return "" +
	"<div class='row'>" +
		"<span class='col-lg-2 text-center'>" +
			"<label for='Email'>Email</label>" +
		"</span>" +
		"<span class='col-lg-6'>" +
			"<input type='email' class='form-control' id='email'>" +
		"</span>" +
	"</div>" +
	"<br>" +
	"<div class='row'>" +
		"<span class='col-lg-2 text-center'>" +
			"<label for='Name' class=''>Nome Completo</label>" +
		"</span>" +
		"<span class='col-lg-6'>" +
			"<input type='text' class='form-control' id='name'>" +
		"</span>" +
	"</div>" +
	"<br>" +
	"<div class='row'>" +
		"<span class='col-lg-2 text-center'>" +
			"<label for='Age' class=''>Idade</label>" +
		"</span>" +
		"<span class='col-lg-6'>" +
			"<input type='number' class='form-control' id='age'>" +
		"</span>" +
	"</div>" +
	"<br>" +
	"<div class='row'>" +
		"<span class='col-lg-2 text-center'>" +
			"<label for='Adress'>Endereço</label>" +
		"</span>" +
		"<span class='col-lg-6'>" +
			"<input type='text' class='form-control' id='adress'>" +
		"</span>" +
	"</div>" +
	"<br>" +
	"<div class='row'>" +
		"<span class='col-lg-2 text-center'>" +
			"<label for='Phone' class=''>Telefone</label>" +
		"</span>" +
		"<span class='col-lg-6'>" +
			"<input type='text' class='form-control' id='phone'>" +
		"</span>" +
	"</div>" +
	"<br>";
}

function specificForms(formValue){
	if ( formValue === "Aluno" ) {
		return "";
	}
	else if ( formValue === "Professor" ) {
		return "" +
		"<div class='row'>" +
			"<span class='col-lg-2 text-center'>" +
				"<label for='Areas' class=''>Areas de Conhecimento</label>" +
			"</span>" +
			"<span class='col-lg-6'>" +
				"<input type='text' class='form-control' id='areas'>" +
			"</span>" +
		"</div>";
	}
	else{
		return "Um erro interno ocorreu";
	}
}

function createUser() {

    var map = {};
    $(".form-control").each(function() {
        map[$(this).attr("id")] = $(this).val();
    });

    function checkEmptyFields(map) {
        for (var m in map){
            for (var i = 0; i < map[m].length; i++){
                if(!map[m][i] || map[m][i] === ""){
                    return false;
                }
            }
        }
        return true;
    }

    if (checkEmptyFields(map)) {
		showAlert("alert-warning", "emptyFields");
		return;
	}

    var paramsString = JSON.stringify(map);

    //TODO: FIX UGLY GET
	$.ajax({
		dataType: "text",
		url: "ServletCreateUser?" +
		"type=" + map["type"] +
        "&params=" + paramsString,
		success: function () {
			showAlert("alert-success", "createdGame");
		}
	});

}

function showAlert (alertClass, alertMessage) {

	$('#alertMessage').html(
		"<div id='alertDiv' class='alert alert-dismissible " + alertClass + "' role='alert'><button type='button' class='close' data-dismiss='alert'aria-label='Close'><span aria-hidden='true'>&times;</span></button>" + alertMessage + "</div>"
	);
	$("#alertDiv").fadeTo(3000, 500).slideUp(500, function(){
		$("#alertDiv").alert('close');
	});

}
