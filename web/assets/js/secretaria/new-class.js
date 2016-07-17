var totalStudents;
var totalSubjects;
var currentStep = 1;

$(document).ready(function () {
    //Inicializa as tooltips
    $('.nav-tabs > li a[title]').tooltip();

    //Move o wizard
    $("a[data-toggle='tab']").on('show.bs.tab', function (e) {
        var $target = $(e.target);
        if ($target.parent().hasClass('disabled')) {
            return false;
        }
        else{
            currentStep = $(this).attr('href').substr(5);
        }
    });

    $('.next-step').click(function (e) {

        if(canProceed()){
            var $active = $('.wizard .nav-tabs li.active');
            $active.next().removeClass('disabled');
            nextTab($active);

            if(currentStep == 2){
                totalSubjects = normalize($('#totalSubjects').val(), $('#totalSubjects').attr('max'));
                buildStep2Div();
            }
            else if(currentStep == 3){
                totalStudents = normalize($('#totalStudents').val(), $('#totalStudents').attr('max'));
                buildStep3Div();
            }
            else if(currentStep == 4){
                buildStep4Div();
            }
            else if(currentStep == 5){
                $("a[data-toggle='tab']").parent().addClass('disabled');
            }
        }
        else{
            showAlert();
        }

    });
    $('.prev-step').click(function (e) {

        var $active = $('.wizard .nav-tabs li.active');
        prevTab($active);
        $active.next().addClass('disabled');

    });

});

function nextTab(elem) {
    $(elem).next().find("a[data-toggle='tab']").click();
}
function prevTab(elem) {
    $(elem).prev().find("a[data-toggle='tab']").click();
}

function canProceed(){

    var $inputs = $('#step' + currentStep + ' input');

    for (var i = 0, len = $inputs.length; i < len; i++) {
        if ( !$inputs[i].value ) {
            return false;
        }
    }
    return true;
}

function normalize(value, max){
    if(parseInt(value) > parseInt(max)){
        return max;
    }
    else if(value < 0){
        return 1;
    }
    else{
        return value;
    }
}

function getRemainingItems(remaining){
    var counter = 0;
    while(remaining - counter !== 0){
        counter++;
    }
    return counter;
}

function buildStep2Div() {

    var divContent = '';
    var loopCounter = 1;
    var remainingSubjects = totalSubjects;

    divContent += "<div class='row'>";

    while (remainingSubjects > 0) {

        divContent +=
            "<div class='col-lg-3'>" +
                "<div class='panel panel-default'>" +
                "<div class='panel-heading'>Disciplina " + loopCounter + "</div>" +
                    "<div class='panel-body'>" +
                        "<label for='Subject'>Nome</label>" +
                        "<br>" +
                    	"<input type='text' class='form-control' id='subject" + loopCounter + "'>" +
                        "<br>" +
                        "<label for='Teacher'>Professor</label>" +
                        "<br>" +
                    	"<input type='number' max='999999' placeholder='Matrícula' class='form-control' id='teacher" + loopCounter + "'>" +
                    "</div>" +
                "</div>" +
            "</div>";

        loopCounter++;
        remainingSubjects--;
    }

    divContent += "</div>";

    $('#step2div').html(divContent);
}

function buildStep3Div(){

    var divContent = '';
    var loopCounter = 1;
    var pageLineItems = 6;
    var iterationStudents;
    var remainingStudents = totalStudents;

    while (remainingStudents > 0) {

        if (remainingStudents - pageLineItems >= 0) {
            remainingStudents -= pageLineItems;
            iterationStudents = pageLineItems;
        }
        else {
            iterationStudents = getRemainingItems(remainingStudents);
            remainingStudents = 0;
        }

        divContent += "<div class='row'>";

        for(i = 0; i < iterationStudents; i++){
            divContent +=
                "<span class='col-lg-2 pull-left'>" +
                    "<label for='Student'>Aluno "+(loopCounter+i)+"</label>" +
                "</span>";
        }

        divContent += "</div><div class='row'>";

        for(i = 0; i < iterationStudents; i++){
            divContent +=
                "<span class='col-lg-2'>" +
                    "<input type='number' max='999999' placeholder='Matrícula' class='form-control' id='student"+(loopCounter+i)+"'>" +
                "</span>";
        }

        divContent += "</div><br>";
        loopCounter += pageLineItems;

    }

    $('#step3div').html(divContent);
}

function buildStep4Div(){

	var divContent = '';
	var subjectContent = '';
	var studentContent = '';

	var $subjectInputs = $('#step2 input');
	var $studentInputs = $('#step3 input');

	subjectContent += "<div class='row'>";

    for (var i = 0, x = $subjectInputs.length; i < x; i+=2) {
		subjectContent += "<div class='col-lg-3'><div class='well' style='margin: 10px;'>" + $subjectInputs[i].value  + " - [Nome do Professor] (" + $subjectInputs[i + 1].value  + ")</div></div>";
    }

	subjectContent += "</div>";
	studentContent += "<div class='row'>";

	for (var j = 0, y = $studentInputs.length; j < y; j++) {
		studentContent += "<div class='col-lg-3'><div class='well' style='margin: 10px;'>" + $studentInputs[j].value  + " - [Nome do Aluno]</div></div>";
    }

	studentContent += "</div>";

	divContent +=
        "<div class='page-header'><h2><small>Nome da Turma</small> " + $('#className').val() + "<h2></div>" +
        "<br>" +
        "<div class='panel panel-info'>" +
			"<div class='panel-heading'>" +
			    "<h3 class='panel-title'>Disciplinas e Professores (" + totalSubjects + ")</h3>" +
			"</div>" +
			"<div class='panel-body'>" +
			    "<div class='panel panel-default'>" + subjectContent + "</div>" +
				"</div>" +
			"</div>" +
			"<div class='panel panel-info'>" +
			    "<div class='panel-heading'>" +
				"<h3 class='panel-title'>Alunos (" + totalStudents + ")</h3>" +
			"</div>" +
			"<div class='panel-body'>" +
			    "<div class='panel panel-default'>" + studentContent + "</div>" +
				"</div>" +
			"</div>" +
        "</div>";

    $('#step4div').html(divContent);

}

function showAlert () {
    $('#invalidForm').html(
        "<div id='invalidAlert' class='alert alert-dismissible alert-warning' role='alert'><button type='button' class='close' data-dismiss='alert'aria-label='Close'><span aria-hidden='true'>&times;</span></button>Certifique-se de preencher todos os campos antes de prosseguir.</div>"
    );
	$('#invalidAlert').fadeTo(3000, 500).slideUp(500, function(){
   		$('#invalidAlert').alert('close');
	});
    userType = '';
}
