var popoverTexts =
{
		"fa fa-question-circle-o fa-lg":" Indefinido! ",
		"fa fa-thumbs-o-down fa-lg":" Reprovado! ",
		"fa fa-thumbs-o-up fa-lg":" Aprovado! "
}

$(document).ready(function(){

	$('.fa').popover();

	$('.form-control').focusout(function(){
		var nota = $(this).val();
		var id = $(this).attr('id').substr(4);
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

	$('#gradesTable').delegate('.fa', 'mouseenter mouseleave', function (event)
	{
		if (event.type == 'mouseenter') {
			console.log("hover");
			$(this).attr('data-content',popoverTexts[$(this).attr('class')]);
			$(this).popover('show');
    } else {
			$(this).popover('hide');
    }
	});

});
