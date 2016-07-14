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
	else if ( formValue === "Responsavel" ) {
		return "" +
		"<div class='row'>" +
			"<span class='col-lg-2 text-center'>" +
				"<label for='entes' class=''>Matrícula do(s) Ente(s)</label>" +
			"</span>" +
			"<span class='col-lg-6'>" +
				"<input type='text' class='form-control' id='entes'>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='col-lg-2 text-center'>" +
				"<label for='AP' class=''>Atuação Profissional</label>" +
			"</span>" +
			"<span class='col-lg-6'>" +
				"<input type='text' class='form-control' id='ap'>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='col-lg-2 text-center'>" +
				"<label for='OP' class=''>Organização Profissional</label>" +
			"</span>" +
			"<span class='col-lg-6'>" +
				"<input type='text' class='form-control' id='op'>" +
			"</span>" +
		"</div>" +
		"<br>";
	}
	else{
		return "Um erro interno ocorreu";
	}
}
