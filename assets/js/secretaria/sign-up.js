function switchForm (formValue, egressoForm){
	document.getElementById("category").value = formValue;
	document.getElementById("create").className = "btn btn-info";
	if(egressoForm){
		document.getElementById("forms").innerHTML =
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='enrollment' class=''>Matrícula</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='number' class='form-control' id='name'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='Name' class=''>Nome</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='text' class='form-control' id='name'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='Pass' class=''>Senha</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='password' class='form-control' id='pass'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='Email'>Email</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='email' class='form-control' id='email'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='Adress'>Endereço</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='text' class='form-control' id='adress'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='Document'>Documento</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='text' class='form-control' id='document'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='Phone' class=''>Telefone</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='text' class='form-control' id='phone'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='Course' class=''>Curso</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='text' class='form-control' id='course'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='Regional' class=''>Regional</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='text' class='form-control' id='regional'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='Area' class=''>Area de Conhecimento</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='text' class='form-control' id='area'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='EM' class=''>Ensino Medio</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='text' class='form-control' id='em'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='PA' class=''>Programas Academicos</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='text' class='form-control' id='pa'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='AP' class=''>Atuação Profissional</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='text' class='form-control' id='ap'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='OP' class=''>Organização Profissional</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='text' class='form-control' id='op'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>";
	}
	else{
		document.getElementById("forms").innerHTML =
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='Name' class=''>Nome</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='text' class='form-control' id='name'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='Email'>Email</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='email' class='form-control' id='email'>" +
				"</span>" +
			"</span>" +
		"</div>" +
		"<br>" +
		"<div class='row'>" +
			"<span class='form-group'>" +
				"<span class='col-lg-2 text-center'>" +
					"<label for='Cargo'>Cargo</label>" +
				"</span>" +
				"<span class='col-lg-6'>" +
					"<input type='text' class='form-control' id='job'>" +
				"</span>" +
			"</span>" +
		"</div>";
	}
}
