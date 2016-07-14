<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="pt-BR">
<head>
  <link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicon/favicon-32x32.png">
  <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
  <link href="../assets/css/bootstrap.css" rel="stylesheet">
  <link href="../assets/css/style.css" rel="stylesheet">
  <meta charset="utf-8">
  <title>Notas</title>
</head>
<body>
  <!-- FIXED TOP NAVBAR -->
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="home.jsp">[Nome da Escola]</a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Docente <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="allClasses.jsp">Visualizar turmas</a></li>
              <li><a href="newActivity.jsp">Cadastrar Atividade/Trabalho</a></li>
              <li><a href="newTest.jsp">Cadastrar Avaliação</a></li>
              <li><a href="releaseNotes.jsp">Visualizar Cadastros</a></li>
              <li><a>Lançar notas</a></li>
              <li class="divider"></li>
              <li><a href="../sign-in.jsp">Sair  <i class="fa fa-sign-out" aria-hidden="true"></i></a></li>
            </ul>
          </li>
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
  </nav>
  <!-- BLUEWRAP -->
  <div id="blue">
    <div class="container-fluid">
      <div class="row">
        <div>
          <h3>Lançamento de Notas</h3>
        </div>
      </div>
      <!-- /row -->
    </div>
    <!-- /container-fluid -->
  </div>
  <!-- /blue -->

  <!-- Conteúdo -->
  <div class="container">
    <div class="row">
      <div class="col-md-10 col-md-offset-1">
        <div class="table-responsive">
          <table id="gradesTable" class="table table-hover table-responsive">
            <thead class="thead-align">
              <tr>
                <!-- NAO CENTRALIZA! -->
                <th>#</th>
                <th>Matrícula</th>
                <th>Nome do Aluno</th>
                <th>Nota</th>
                <th> </th>
              </tr>
            </thead>
            <tbody class="tbody-align">
              <tr>
                <td>1</td>
                <td>100100</td>
                <td>Aluno 1</td>
                <td><input type="number" min="1" max="10" class="form-control" id="nota100100"></td>
                <td><a id="resultado100100" class="btn btn-default" data-container="body" data-toggle="popover"><i class="fa fa-question-circle-o fa-lg" aria-hidden="true"></i></a></td>
              </tr>
              <tr>
                <td>2</td>
                <td>100101</td>
                <td>Aluno 2</td>
                <td><input type="number" min="1" max="10" class="form-control" id="nota100101"></td>
                <td><a id="resultado100101" class="btn btn-default" data-container="body" data-toggle="popover"><i class="fa fa-question-circle-o fa-lg" aria-hidden="true"></i></a></td>
              </tr>
              <tr>
                <td>3</td>
                <td>100102</td>
                <td>Aluno 3</td>
                <td><input type="number" min="1" max="10" class="form-control" id="nota100102"></td>
                <td><a id="resultado100102" class="btn btn-default" data-container="body" data-toggle="popover"><i class="fa fa-question-circle-o fa-lg" aria-hidden="true"></i></a></td>
              </tr>
              <tr>
                <td>4</td>
                <td>100103</td>
                <td>Aluno 4</td>
                <td><input type="number" min="1" max="10" class="form-control" id="nota100103"></td>
                <td><a id="resultado100103" class="btn btn-default" data-container="body" data-toggle="popover"><i class="fa fa-question-circle-o fa-lg" aria-hidden="true"></i></a></td>
              </tr>
            </tbody>
          </table>
          <span>
            <p><a href="releaseNotes.jsp" class="btn btn-default"  style="float:left;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i> Voltar</a>
              <a class="btn btn-theme" style="float:right;" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</a>
            </p>
            <!-- modal -->
            <div id ="myModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Confirmação</h4>
                  </div>
                  <div class="modal-body">
                    <p>Você deseja salvar Alterações?</p>
                  </div>
                  <div class="modal-footer">
                    <a type="button" class="btn btn-default" data-dismiss="modal">Cancelar</a>
                    <a type="button" class="btn btn-primary" href="releaseNotes.jsp" >Salvar</a>
                  </div>
                </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
          </span>
        </div>
      </div>
    </div>
  </div>
  <!-- /Conteúdo -->
</br>
<!-- FOOTER -->
<div id="footerwrap">
  <div class="container">
    <div class="row">
      <div class="col-lg-4">
        <h4>Sobre</h4>
        <div class="hline-w">
        </div>
        <p>Meta e objetivos da escola.</p>
      </div>
      <div class="col-lg-4">
        <h4>Links Sociais/Relacionados</h4>
        <div class="hline-w">
        </div>
        <p>
          <a href="#"><i class="fa fa-facebook"></i></a>
          <a href="#"><i class="fa fa-twitter"></i></a>
          <a href="#"><i class="fa fa-tumblr"></i></a>
        </p>
      </div>
      <div class="col-lg-4">
        <h4>Localização</h4>
        <div class="hline-w">
        </div>
        <p>
          Logradouro, Número,<br/>
          CEP, Cidade, Estado<br/>
          País.<br/>
        </p>
      </div>
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /footerwrap -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/retina-1.1.0.js"></script>
<script src="../assets/js/jquery.hoverdir.js"></script>
<script src="../assets/js/jquery.hoverex.min.js"></script>
<script src="../assets/js/jquery.prettyPhoto.js"></script>
<script src="../assets/js/jquery.isotope.min.js"></script>
<script src="../assets/js/docente/grades.js"></script>
<script src="../assets/js/custom.js"></script>
</body>
</html>
