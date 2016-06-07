$(document).ready(function(){

	$('.form-control').focusout(function(){
		var nota = $(this).val();
		console.log("nota: " + nota);
		var id = $(this).attr('id').substr(4);
		console.log("id: " + id);
		if(nota < 6){
			$('#resultado' + id).html
			(
			"<i class='fa fa-thumbs-o-down fa-lg' style='color:red'aria-hidden='true'></i>"
			);
		}
		else if(nota >= 6){
			$('#resultado' + id).html
			(
			"<i class='fa fa-thumbs-o-up fa-lg' style='color:green' aria-hidden='true'></i>"
			);
		}
	});

});
