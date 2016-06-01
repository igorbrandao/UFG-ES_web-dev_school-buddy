var mockedStudent = {};

function getUserByEnrollmentNumber (searchField) {

    //Simula encontrar um usuário para editar ou não, o que seria o resultado de
    //var user = backend.getUserByEnrollmentNumber(searchField.value) !== undefined
    if ( Math.random() <= 0.5 ) {

    }
    else {
        window.alert("A matrícula informada não pertence a um usuário cadastrado no sistema.");
    }
}
