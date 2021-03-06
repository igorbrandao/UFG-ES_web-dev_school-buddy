<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="pt-BR">
<head>
  <link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicon/favicon-32x32.png">
  <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
  <link href="../assets/css/bootstrap.css" rel="stylesheet">
  <link href="../assets/css/style.css" rel="stylesheet">
  <meta charset="utf-8">
  <title>Cadastro de Atividade</title>
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
              <li><a href="#">Visualizar turmas</a></li>
              <li><a>Cadastrar Atividade/Trabalho</a></li>
              <li><a href="newTest.jsp">Cadastrar Avaliação</a></li>
              <li><a href="releaseNotes.jsp">Visualizar Cadastros</a></li>
              <li><a href="releaseNotes.jsp#myModal">Lançar notas</a></li>
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
          <h3>[Turma Selecionada] - [Disciplina] - Cadastro de Atividade/Trabalho</h3>
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
      <div class="col-md-6 col-md-offset-3">
        <div class="row">
          <span class="form-group">
            <span class="col-lg-4">
              <label for="titulo">Titulo</label>
            </span>
            <span class="col-lg-8">
              <form>
              <input action="" method=”post” type="text" class="form-control" name="titulo" id="titulo">
              </form>
            </span>
          </span>
        </div>
        <br>
        <div class="row">
          <span class="form-group">
            <span class="col-lg-4">
              <label for="dataInicio">Data de Inicio</label>
            </span>
            <span class="col-lg-8">
              <form>
                <input type="text" pattern="\d{1,2}/\d{1,2}/\d{4}" class="datepicker" name="dataInicio" id="dataInicio">
              </form>
            </span>
          </span>
        </div>
        <br>
        <div class="row">
          <span class="form-group">
            <span class="col-lg-4">
              <label for="dataFim">Data Limite</label>
            </span>
            <span class="col-lg-8">
              <form>
                <input type="text" pattern="\d{1,2}/\d{1,2}/\d{4}" class="datepicker" name="dataFim" id="dataFim">
              </form>
            </span>
          </span>
        </div>
        <br>
        <div class="row">
          <span class="form-group">
            <span class="col-lg-4">
              <label for="peso">Peso</label>
            </span>
            <span class="col-lg-8">
              <input action="" method="post" type="number" class="form-control" name="peso" id="peso">
            </span>
          </span>
        </div>
        <br>
        <div class="row">
          <span class="form-group">
            <span class="col-lg-4">
              <label for="descricao" >Descricao</label>
            </span>
            <span class="col-lg-8">
              <textarea action="" method="post" class="form-control" rows="5" name="descricao" id="descricao"></textarea>
            </span>
          </span>
        </div>
        <div class="row">
          <span class="col-lg-12">
            <p><a href="detailedClass.jsp" class="btn btn-default"  style="float:left;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i> Voltar</a>
              <a href="detailedClass.jsp" class="btn btn-theme" style="float:right;" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-floppy-disk"></span> Cadastrar</a>
            </p>
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
                    <a type="button" class="btn btn-primary" href="detailedClass.jsp" >Salvar</a>
                  </div>
                </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
          </span>
        </div>
      </div>
    </div>
  </div>
</br>
</br>
<!--/service -->
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
<script src="../assets/js/docente/home.js"></script>
<script src="../assets/js/custom.js"></script>
</body>
</html>
