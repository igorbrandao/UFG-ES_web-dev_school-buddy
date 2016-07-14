var classData;
var deletingClassID;

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

$(document).ready(function () {

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

    $('#classesTable').delegate('.glyphicon-option-vertical', 'click', function () {
        var editingRow = $('table#classesTable').find('tbody').find('tr#' + $(this).attr('id'));
        classData =
        {
            "className":$(editingRow).find('td:eq(0)').html(),
            "totalSubjects":$(editingRow).find('td:eq(2)').html(),
            "totalStudents":$(editingRow).find('td:eq(1)').html(),
            "active":$(editingRow).find('td:eq(3)').find('input').attr('checked')
        };
        //alert(JSON.stringify(classData, null, 2));
        generateClassMockRepetition(classData.totalSubjects, classData.totalStudents);
        $('#detailClass').find("#detailModalTitle").html("Visualizando turma " + classData.className + ": " + classData.totalSubjects + " disciplinas e " + classData.totalStudents + " alunos.");
        buildSubjectsDiv();
        buildStudentsDiv();
    });

    $('#classesTable').delegate('.glyphicon-remove', 'click', function () {
        var deletingRow = $('table#classesTable').find('tbody').find('tr#' + $(this).attr('id'));
        classData =
        {
            "className":$(deletingRow).find('td:eq(0)').html(),
            "totalSubjects":$(deletingRow).find('td:eq(2)').html(),
            "totalStudents":$(deletingRow).find('td:eq(1)').html(),
            "active":$(deletingRow).find('td:eq(3)').find('input').attr('checked')
        };
        deletingClassID = $(this).attr('id');
        $("#deleteModalTitle").html("Atenção! Deletando Turma " + classData.className + ".");
        $("#deletingClassInfo").html("<b>Total de Alunos: </b>" + classData.totalStudents + "<br>" + "<b>Total de Disciplinas: </b>" + classData.totalSubjects + ".");
    });

 });

function generateClassMockRepetition(subjects, students){
    for(var x = 1; x <= subjects; x++){
        classData["subject" + x] = subjectNames[x];
        classData["teacher" + x] = (201260 + x).toString();
    }
    for(var y = 1; y <= students; y++){
        classData["student" + y] = (101256 + y).toString();
    }
}

function buildSubjectsDiv(){

    var divContent = "";
    var subjectContent = "";
    var subjectEntries = [];
    var teacherEntries = [];

    for (var entry in classData) {
        if(entry.startsWith("subject")){
            subjectEntries.push(entry);
        }
        if(entry.startsWith("teacher")){
            teacherEntries.push(entry);
        }
    }

    subjectContent += "<div class='row'>";

    for (var i = 0; i < subjectEntries.length; i++) {
        subjectContent += "<div class='col-md-4'><div class='well' style='margin: 10px;'>" + classData[subjectEntries[i]]  + " - [Nome do Professor] (" + classData[teacherEntries[i]]  + ")</div></div>";
    }

    subjectContent += "</div>";

    divContent +=
        "<div class='panel panel-info'>" +
            "<div class='panel-heading'>" +
                "<h6 class='panel-title'>Disciplinas e Professores (" + classData.totalSubjects + ")</h6>" +
            "</div>" +
            "<div class='panel-body'>" +
                "<div class='panel panel-default'>" + subjectContent + "</div>" +
            "</div>" +
        "</div>";

    $('#subjectsDiv').html(divContent);
}

function buildStudentsDiv () {

    var divContent = "";
    var studentContent = "";

    studentContent += "<div class='row'>";

    for (var entry in classData) {
        if(entry.startsWith("student")){
            studentContent += "<div class='col-md-3'><div class='well' style='margin: 10px;'>" + classData[entry] + " - [Nome do Aluno]</div></div>";
        }
    }

    studentContent += "</div>";

    divContent +=
        "<div class='panel panel-info'>" +
            "<div class='panel-heading'>" +
                "<h6 class='panel-title'>Alunos (" + classData.totalStudents + ")</h6>" +
            "</div>" +
            "<div class='panel-body'>" +
                "<div class='panel panel-default'>" + studentContent + "</div>" +
            "</div>" +
        "</div>";

    $('#studentsDiv').html(divContent);
}

function deleteClass () {
    $('table#classesTable').find('tbody').find('#' + deletingClassID).html("");
    showAlert();
}

function showAlert () {
    $('#queryResult').html(
        "<div id='queryAlert' class='alert alert-dismissible alert-primary' role='alert'><button type='button' class='close' data-dismiss='alert'aria-label='Close'><span aria-hidden='true'>&times;</span></button>" + "A turma " + classData.className + " foi apagada." + "</div>"
    );
	$("#queryAlert").fadeTo(3000, 500).slideUp(500, function(){
   		$("#queryAlert").alert('close');
	});
}
