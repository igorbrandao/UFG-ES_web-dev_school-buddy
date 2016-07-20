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
            "<label for='Password' class=''>Senha</label>" +
        "</span>" +
        "<span class='col-lg-6'>" +
            "<input type='password' class='form-control' id='password'>" +
        "</span>" +
    "</div>" +
    "<br>" +
    "<div class='row'>" +
        "<span class='col-lg-2 text-center'>" +
            "<label for='RepeatPassword' class=''>Repita a Senha</label>" +
        "</span>" +
        "<span class='col-lg-6'>" +
            "<input type='password' class='form-control' id='repeatPassword'>" +
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
			"<input type='text' class='form-control' id='address'>" +
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
    if ( formValue === "Discente" ) {
        return "";
    }
    else if ( formValue === "Docente" ) {
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
    $("input").each(function() {
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
		url: "ServletCreateUser",
		data: map,
		dataType: "text"
	});

	request.done(function (data){

        if(data) {
            $('#modalLabel').html("Usuário Criado!");
            $('#modalMessage').html("Essa conta está pronta para uso. Para acessá-la, a matrícula <b>" + data + "</b> e a senha informada devem ser informadas na tela inicial.");
        }
        else{
            $('#modalLabel').html("Bad response...");
            $('#modalMessage').html("A servlet respondeu a essa requisição de forma inesperada.");
        }

	});

	request.fail(function (textStatus, errorThrown){
        $('#modalLabel').html("Ops...");
        $('#modalMessage').html("Encontramos um problema na criação desse usuário, tente novamente por favor. Detalhes da mensagem: " + textStatus.toString() + ", Erro: " + errorThrown.toString());
	});

	request.always(function (){
        $('#creationModal').modal('toggle');
	});

	event.preventDefault();

}

function showAlert (alertClass, message) {

    $('#alertMessage').html(
        "<div id='alertDiv' class='alert alert-dismissible " + alertClass + "' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>" + message + "</div>"
    );
    $("#alertDiv").fadeTo(3000, 500).slideUp(500, function(){
        $("#alertDiv").alert('close');
    });
    userType = "";

}
