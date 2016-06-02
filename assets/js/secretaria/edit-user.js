var mockedStudent =
{
        "enrollment": "341258",
        "name": "Ashley Jacobs",
        "email": "email2@domain2.com",
        "adress": "AVENIDA 85, 759 - QD F-24 - LT 91 - ED. FELICIDADE / SETOR SUL - GOIÂNIA CEP: 74080-010",
        "phone": "(62)98712-3840",
        "age": "19"
};

function getUserByEnrollmentNumber (searchField) {

    //Simula encontrar um usuário para editar ou não, o que seria o resultado de
    //var user = backend.getUserByEnrollmentNumber(searchField.value) !== undefined
    if ( Math.random() <= 0.5 ) {

    }
    else {
        window.alert("A matrícula informada não pertence a um usuário cadastrado no sistema.");
    }
}

function updateUser (newUserData) {
    window.alert("Dados do usuário atualizados com sucesso.");
}
