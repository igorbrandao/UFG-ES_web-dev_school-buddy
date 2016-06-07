var totalStudents;
var totalSubjects;
var currentStep = 1;

$(document).ready(function () {
    //Initializa as tooltips
    $('.nav-tabs > li a[title]').tooltip();

    //Move o wizard
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
        var $target = $(e.target);
        if ($target.parent().hasClass('disabled')) {
            return false;
        }
        else{
            currentStep = $(this).attr('href').substr(5);
            console.log("currentStep changed by wizard: " + currentStep);
        }
    });

    $(".next-step").click(function (e) {

        if(canProceed()){
            var $active = $('.wizard .nav-tabs li.active');
            $active.next().removeClass('disabled');
            nextTab($active);

            if(currentStep == 2){
                console.log("$('#totalSubjects').val(): " + $('#totalSubjects').val());
                console.log("$('#totalSubjects').attr('max'): " + $('#totalSubjects').attr('max'));
                totalSubjects = normalize($('#totalSubjects').val(), $('#totalSubjects').attr('max'));
                console.log("totalSubjects: " + totalSubjects);
                console.log("building step 2 div.");
                buildStep2Div();
                console.log("finished building step 2 div.");
            }
            else if(currentStep == 3){
                console.log("$('#totalStudents').val(): " + $('#totalStudents').val());
                console.log("$('#totalStudents').attr('max'): " + $('#totalStudents').attr('max'));
                totalStudents = normalize($('#totalStudents').val(), $('#totalStudents').attr('max'));
                console.log("totalStudents: " + totalStudents);
                console.log("building step 3 div.");
                buildStep3Div();
                console.log("finished building step 3 div.");
            }
            else if(currentStep == 4){
                buildStep4Div();
            }
        }
        else{
            showAlert();
        }

    });
    $(".prev-step").click(function (e) {

        var $active = $('.wizard .nav-tabs li.active');
        prevTab($active);

    });

});

function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
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
    console.log("value: " + value);
    console.log("max: " + max);
    if(value > max){
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

    var divContent = "";
    var loopCounter = 1;
    var pageLineItems = 3;
    var iterationSubjects;
    var remainingSubjects = totalSubjects;

    while (remainingSubjects > 0) {

        if (remainingSubjects - pageLineItems >= 0) {
            remainingSubjects -= pageLineItems;
            iterationSubjects = pageLineItems;
        }
        else {
            iterationSubjects = getRemainingItems(remainingSubjects);
            remainingSubjects = 0;
        }

        divContent += "<div class='row'>";

        for(i = 0; i < iterationSubjects; i++){
            divContent +=
                "<span class='col-lg-2 pull-left'>" +
    			    "<label for='Subject'>Disciplina "+(loopCounter+i)+"</label>" +
        		"</span>" +
                "<span class='col-lg-2 pull-left'>" +
        			"<label for='Teacher'>Professor "+(loopCounter+i)+"</label>" +
        		"</span>";
        }

        divContent += "</div><div class='row'>";

        for(i = 0; i < iterationSubjects; i++){
            divContent +=
                "<span class='col-lg-2'>" +
        			"<input type='text' class='form-control' id='subject"+(loopCounter+i)+"'>" +
        		"</span>" +
        		"<span class='col-lg-2'>" +
        			"<input type='number' placeholder='Matrícula' class='form-control' id='teacher"+(loopCounter+i)+"'>" +
        		"</span>";
        }

        divContent += "</div><br>";
        loopCounter += pageLineItems;

    }
    $("#step2div").html(divContent);
}

function buildStep3Div(){

    var divContent = "";
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
                    "<input type='number' placeholder='Matrícula' class='form-control' id='teacher"+(loopCounter+i)+"'>" +
                "</span>";
        }

        divContent += "</div><br>";
        loopCounter += pageLineItems;

    }

    $("#step3div").html(divContent);
}

function buildStep4Div(){
    //revisão
}

function showAlert () {
    $('#invalidForm').html(
        "<div id='invalidAlert' class='alert alert-dismissible alert-warning' role='alert'><button type='button' class='close' data-dismiss='alert'aria-label='Close'><span aria-hidden='true'>&times;</span></button>Certifique-se de preencher todos os campos antes de prosseguir.</div>"
    );
	$("#invalidAlert").fadeTo(3000, 500).slideUp(500, function(){
   		$("#invalidAlert").alert('close');
	});
    userType = "";
}
