<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="pt-BR">
<head>
  <link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicon/favicon-32x32.png">
  <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
  <link href="../assets/css/bootstrap.css" rel="stylesheet">
  <link href="../assets/css/style.css" rel="stylesheet">
  <meta charset="utf-8">
  <title>Atividades/Avaliações</title>
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
              <li><a>Visualizar Cadastros</a></li>
              <li><a href="grades.jsp">Lançar notas</a></li>
              <li class="divider"></li>
              <li><a href="../sign-in.jsp" >Sair  <i class="fa fa-sign-out" aria-hidden="true"></i></a></li>
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
          <h3>[Turma Selecionada] - [Matéria] - Atividades e Avaliações Cadastradas</h3>
        </div>
      </div>
      <!-- /row -->
    </div>
    <!-- /container-fluid -->
  </div>
  <!-- /blue -->
  <!-- SERVICE LOGOS -->
  <div class="container">
    <div class="row">
      <div class="col-md-10 col-md-offset-1">
        <!-- Lista de Turmas -->
        <div class="table-responsive">
          <table class="table table-hover">
            <thead class="thead-align">
              <tr>
                <!-- NAO CENTRALIZA! -->
                <th>#</th>
                <th>Atividades</th>
                <th>Peso</th>
                <th>Lançar Notas</th>
              </tr>
            </thead>
            <tbody class="tbody-align">
              <tr>
                <td>1</td>
                <td>Trabalho 1</td>
                <td>4,00</td>
                <td><a href="grades.jsp" class="btn btn-theme"><i class="fa fa-arrow-right" aria-hidden="true"></i></a></td>
                <!-- Botão ao final da linha para visualização de mais detalhes da turma-->
              </tr>
              <tr>
                <td>2</td>
                <td>Atividade 2</td>
                <td>1,00</td>
                <td><a href="grades.jsp" class="btn btn-theme"><i class="fa fa-arrow-right" aria-hidden="true"></i></a></td>
                <!-- Botão ao final da linha para visualização de mais detalhes da turma-->
              </tr>
            </tbody>
          </table>
          <div class="table-responsive">
            <table class="table table-hover">
              <thead class="thead-align">
                <tr>
                  <!-- NAO CENTRALIZA! -->
                  <th>#</th>
                  <th>Avaliações</th>
                  <th>Peso</th>
                  <th>Lançar Notas</th>
                </tr>
              </thead>
              <tbody class="tbody-align">
                <tr>
                  <td>1</td>
                  <td>Avaliação 1</td>
                  <td>5,00</td>
                  <td><a href="grades.jsp" class="btn btn-theme"><i class="fa fa-arrow-right" aria-hidden="true"></i></a></td>
                  <!-- Botão ao final da linha para visualização de mais detalhes da turma-->
                </tr>
              </table>
            </div>
          </div>
          <p><a href="detailedClass.jsp" class="btn btn-default" style="float:left;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i> Voltar</a></p>
        </div>
      </div>
      <!--/container -->
    </div>
    <!--/service -->
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

  <!-- modal -->
  <div id ="myModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Aviso</h4>
        </div>
        <div class="modal-body">
          <p>Antes de realizar esta ação, selecione uma Atividade/Avaliação Cadastrada!</p>
        </div>
        <div class="modal-footer">
          <a type="button" class="btn btn-primary" data-dismiss="modal" >Ok</a>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script src="../assets/js/bootstrap.min.js"></script>
  <script src="../assets/js/retina-1.1.0.js"></script>
  <script src="../assets/js/jquery.hoverdir.js"></script>
  <script src="../assets/js/jquery.hoverex.min.js"></script>
  <script src="../assets/js/jquery.prettyPhoto.js"></script>
  <script src="../assets/js/jquery.isotope.min.js"></script>
  <script src="../assets/js/docente/modals-opt.js"></script>
  <script src="../assets/js/custom.js"></script>
</body>
</html>
