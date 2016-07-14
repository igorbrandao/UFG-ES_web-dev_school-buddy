var classData;
var addedSubjects = 0;
var addedStudents = 0;

var alertTexts =
{
        "notFound": "Uma turma com o nome informado não existe."
};

var subjectNames =
{
    1:"Português",
    2:"Matemática",
    3:"História",
    4:"Geografia",
    5:"Biologia",
    6:"Química",
    7:"Física",
    8:"Inglês",
    9:"Espanhol",
    10:"Francês"
};

var mockedClass =
{
    "className":"1° Ano A",
    "totalSubjects":"2",
    "totalStudents":"10"
};

$(document).ready(function () {

    $( function () {
        for(var x = 1; x <= 2; x++){
            mockedClass["subject" + x] = subjectNames[x];
            mockedClass["teacher" + x] = (201260 + x).toString();
        }
        for(var y = 1; y <= 10; y++){
            mockedClass["student" + y] = (101256 + y).toString();
        }
        //alert(JSON.stringify(mockedClass, null, 2));
    });

    $('button#find').on('click', function () {
        addedSubjects = 0;
        addedStudents = 0;
        $('#newSubjectsDiv').html("");
        $('#newStudentsDiv').html("");
        $('#existingSubjectsDiv').html("");
        $('#existingStudentsDiv').html("");
        $(this).attr('data-target', mockSearch());
    });

    $('input#addSubjects').focusout(function(){
        addedSubjects = normalize($(this).val(), 10 - classData.totalSubjects);
        updateModal();
        buildNewSubjectsDiv();
    });

    $('input#addStudents').focusout(function(){
        addedStudents = normalize($(this).val(), 50 - classData.totalStudents);
        updateModal();
        buildNewStudentsDiv();
    });

});

function getClassStatus(active){
    return active ? "editClass" : "seeClass";
}

function getRemainingItems(remaining, limit){
    var counter = 0;
    while(remaining + counter <= limit){
        counter++;
    }
    return counter;
}

function normalize(value, max){
    if(parseInt(value) > parseInt(max)){
        return max;
    }
    else if(value < 0 || !value){
        return 0;
    }
    else{
        return value;
    }
}

function updateModal(active){
    if(active){
        $('#' + getClassStatus(active)).find("#editModalTitle").html("Editando turma " + classData.className + ": " + (parseInt(classData.totalSubjects) + parseInt(addedSubjects)) + " disciplinas e " + (parseInt(classData.totalStudents) + parseInt(addedStudents)) + " alunos.");
        $('#addSubjects').attr('max', 10 - classData.totalSubjects);
        $('#addStudents').attr('max', 50 - classData.totalStudents);
    }
    else{
        $('#' + getClassStatus(active)).find("#seeModalTitle").html("Visualizando turma " + classData.className + ": " + classData.totalSubjects + " disciplinas e " + classData.totalStudents + " alunos.");
    }
}

function mockSearch() {

    //Simula encontrar um usuário para editar ou não, o que seria o resultado de
    //var user = backend.getClassByNumber(searchField.value) !== undefined

    var chance = Math.random();

    if ( chance <= 0.33 ) {
        classData = mockedClass;
        classData.active = true;
        alertTexts.close = "A turma " + classData.className + " foi encerrada.";
        alertTexts.update = "Os dados da turma " + classData.className + " foram alterados.";
        alertTexts.delete = "A turma " + classData.className + " foi apagada.";
        updateModal(classData.active);
        buildExistingSubjectsDiv("existingSubjectsDiv");
        buildExistingStudentsDiv("existingStudentsDiv");
        return "#editClass";
    }
    else if ( chance > 0.33 && chance <= 0.66 ) {
        classData = mockedClass;
        classData.active = false;
        alertTexts.close = "A turma " + classData.className + " foi encerrada.";
        alertTexts.update = "Os dados da turma " + classData.className + " foram alterados.";
        alertTexts.delete = "A turma " + classData.className + " foi apagada.";
        updateModal(classData.active);
        buildExistingSubjectsDiv("closedSubjectsDiv");
        buildExistingStudentsDiv("closedStudentsDiv");
        return "#seeClass";
    }
    else {
        showAlert("notFound", "alert-warning");
        return "";
    }

}

function buildNewSubjectsDiv(){

    var divContent = "";
    var loopCounter = 1 + parseInt(classData.totalSubjects);
    var remainingSubjects = 1;

    divContent += "<div class='row'>";

    while (remainingSubjects <= addedSubjects) {

        divContent +=
            "<div class='col-lg-3'>" +
                "<div class='panel panel-default'>" +
                "<div class='panel-heading'>Nova Disciplina " + loopCounter + "</div>" +
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
        remainingSubjects++;
    }

    divContent += "</div>";

    $('#newSubjectsDiv').html(divContent);
}

function buildNewStudentsDiv(){

    var divContent = "";
    var loopCounter = 1 + parseInt(classData.totalStudents);
    var pageLineItems = 6;
    var iterationStudents;
    var remainingStudents = 1;

    while (remainingStudents <= addedStudents) {

        if (remainingStudents + pageLineItems <= addedStudents) {
            remainingStudents += pageLineItems;
            iterationStudents = pageLineItems;
        }
        else {
            iterationStudents = getRemainingItems(remainingStudents, addedStudents);
            remainingStudents = addedStudents + 1;
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

    $('#newStudentsDiv').html(divContent);
}

function buildExistingSubjectsDiv(divID){

    var divContent = "";
    var subjectContent = "";
    var subjectEntries = [];
    var teacherEntries = [];

    for (var entry in mockedClass) {
        if(entry.startsWith("subject")){
            subjectEntries.push(entry);
        }
        if(entry.startsWith("teacher")){
            teacherEntries.push(entry);
        }
    }

    subjectContent += "<div class='row'>";

    for (var i = 0; i < subjectEntries.length; i++) {
        subjectContent += "<div class='col-md-4'><div class='well' style='margin: 10px;'>" + mockedClass[subjectEntries[i]]  + " - [Nome do Professor] (" + mockedClass[teacherEntries[i]]  + ")</div></div>";
    }

    subjectContent += "</div>";

    divContent +=
        "<div class='panel panel-info'>" +
            "<div class='panel-heading'>" +
                "<h3 class='panel-title'>Disciplinas e Professores (" + mockedClass.totalSubjects + ")</h3>" +
            "</div>" +
            "<div class='panel-body'>" +
                "<div class='panel panel-default'>" + subjectContent + "</div>" +
            "</div>" +
        "</div>";

    $('#' + divID).html(divContent);
}

function buildExistingStudentsDiv(divID){

    var divContent = "";
    var studentContent = "";

    studentContent += "<div class='row'>";

    for (var entry in mockedClass) {
        if(entry.startsWith("student")){
            studentContent += "<div class='col-md-3'><div class='well' style='margin: 10px;'>" + mockedClass[entry] + " - [Nome do Aluno]</div></div>";
        }
    }

    studentContent += "</div>";

    divContent +=
        "<div class='panel panel-info'>" +
            "<div class='panel-heading'>" +
                "<h3 class='panel-title'>Alunos (" + mockedClass.totalStudents + ")</h3>" +
            "</div>" +
            "<div class='panel-body'>" +
                "<div class='panel panel-default'>" + studentContent + "</div>" +
            "</div>" +
        "</div>";

    $('#' + divID).html(divContent);
}

function showAlert (alertType, alertClass) {
    $('#queryResult').html(
        "<div id='queryAlert' class='alert alert-dismissible " + alertClass + "' role='alert'><button type='button' class='close' data-dismiss='alert'aria-label='Close'><span aria-hidden='true'>&times;</span></button>" + alertTexts[alertType] + "</div>"
    );
	$("#queryAlert").fadeTo(3000, 500).slideUp(500, function(){
   		$("#queryAlert").alert('close');
	});
}
