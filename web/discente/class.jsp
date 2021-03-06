<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="pt-BR">
	<head>
		<link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicon/favicon-32x32.png">
        <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="../assets/css/bootstrap.css" rel="stylesheet">
        <link href="../assets/css/style.css" rel="stylesheet">
		<meta charset="utf-8">
		<title>Turma</title>
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
    						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Nome do Aluno<b class="caret"></b></a>
    						<ul class="dropdown-menu">
								<li><a href="report-card.jsp">Vizualizar Boletim</a></li>
    							<li class="divider"></li>
    							<li><a href="../sign-in.jsp" >Sair  <i class="fa fa-sign-out" aria-hidden="true"></i></a></li>
    						</ul>
    					</li>
    				</ul>
    			</div><!-- /.navbar-collapse -->
    		</div><!-- /.container-fluid -->
    	</nav>

		<!-- BLUEWRAP -->

		<div id="blue">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<h3>Olá, [Nome do Aluno].</h3>
						<h5>Essas são as suas disciplinas do ano letivo.</h5>
					</div>
				</div><!-- /row -->
			</div><!-- /container-fluid -->
		</div><!-- /blue -->


				<!-- CONTENT -->

				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="panel panel-default">
							<div class="panel-body">
								<div>
									<h4 class="pull-left">Disciplinas</h4>
								</div>
								<div class="pull-right">
									<div class="btn-group">
										<button type="button" class="btn btn-info btn-filter" data-target="primeiro">Português</button>
										<button type="button" class="btn btn-success btn-filter" data-target="segundo">Matemática</button>
										<button type="button" class="btn btn-primary btn-filter" data-target="terceiro">História</button>
										<button type="button" class="btn btn-warning btn-filter" data-target="quarto">Ciências</button>
										<button type="button" class="btn btn-danger btn-filter" data-target="quinto">Geografia</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- Lembretes -->
					<div class="col-md-10 col-md-offset-1">
						<div class="panel panel-default">
							<h4>Lembretes</h4>
							<table id="usersTable" name="usersTable" class="table">
								<tr data-status="primeiro">
									<th>27/01/2017</th>
								</tr>
								<tr data-status="primeiro">
									<td>Não haverá aula dia 29/01/2017.</td>
								</tr>
								<tr data-status="segundo">
									<th>30/01/2017</th>
									<th>15/03/2017</th>
								</tr>
								<tr data-status="segundo">
									<td>A primeira prova ficou marcada para o dia 28/02/2017.</td>
									<td>A data de entrega do trabalho 2 foi alterada para o dia 20/03/2017.</td>
								</tr>
								<tr data-status="terceiro">
									<th>15/01/2017</th>
									<th>22/01/2017</th>
								</tr>
								<tr data-status="terceiro">
									<td>A aula do dia 16/02/2017 será no laboratório.</td>
									<td>Para aula de amanhã 23/01/2017 será necessário levar o livro.</td>
								</tr>
								<tr data-status="quarto">
									<th>14/01/2017</th>
									<th>21/01/2017</th>
								</tr>
								<tr data-status="quarto">
									<td>Amanhã a aula será prática.</td>
									<td>A lista de atividades já está na xerox.</td>
								</tr>
								<tr data-status="quarto">
									<th>28/01/2017</th>
									<th>04/02/2017</th>
								</tr>
								<tr data-status="quarto">
									<td>Amanhã começa as apresentações do trabalho 1.</td>
									<td>Não haverá aula amanhã</td>
								</tr>
								<tr data-status="quinto">
									<th>27/01/2017</th>
								</tr>
								<tr data-status="quinto">
									<td>A apostila já se encontra na xerox.</td>
								</tr>
							</table>
						</div> <!-- /painel -->
					</div> <!-- /col-md -->
					<!-- CHAMADA -->
					<div class="col-md-3 col-md-offset-1">
						<div class="panel panel-default">
							<h4>Chamada</h4>
							<table id="usersTable" name ="usersTable" class="table">
								<tr data-status="primeiro">
									<th>Data</th>
									<th>Status</th>
								</tr>
								<tr data-status="primeiro">
									<td>30/01/2017</td>
									<td>Presente</td>
								</tr>
								<tr data-status="primeiro">
									<td>06/02/2017</td>
									<td>Presente</td>
								</tr>
								<tr data-status="primeiro">
									<td>13/02/2017</td>
									<td>Falta</td>
								</tr>
								<tr data-status="primeiro">
									<td>20/02/2017</td>
									<td>Falta</td>
								</tr>
								<tr data-status="primeiro">
									<td>27/02/2017</td>
									<td>Falta</td>
								</tr>
								<tr data-status="primeiro">
									<td>01/03/2017</td>
									<td>Presente</td>
								</tr>
								<tr data-status="segundo">
									<th>Data</th>
									<th>Status</th>
								</tr>
								<tr data-status="segundo">
									<td>31/01/2017</td>
									<td>Presente</td>
								</tr>
								<tr data-status="segundo">
									<td>07/02/2017</td>
									<td>Presente</td>
								</tr>
								<tr data-status="segundo">
									<td>14/02/2017</td>
									<td>Falta</td>
								</tr>
								<tr data-status="segundo">
									<td>21/02/2017</td>
									<td>Presente</td>
								</tr>
								<tr data-status="terceiro">
									<th>Data</th>
									<th>Status</th>
								</tr>
								<tr data-status="terceiro">
									<td>01/02/2017</td>
									<td>Presente</td>
								</tr>
								<tr data-status="quarto">
									<th>Data</th>
									<th>Status</th>
								</tr>
								<tr data-status="quarto">
									<td>02/02/2017</td>
									<td>Presente</td>
								</tr>
								<tr data-status="quarto">
									<td>09/02/2017</td>
									<td>Presente</td>
								</tr>
								<tr data-status="quinto">
									<th>Data</th>
									<th>Status</th>
								</tr>
								<tr data-status="quinto">
									<td>03/02/2017</td>
									<td>Presente</td>
								</tr>
								<tr data-status="quinto">
									<td>10/02/2017</td>
									<td>Presente</td>
								</tr>
								<tr data-status="quinto">
									<td>17/02/2017</td>
									<td>Presente</td>
								</tr>
							</table>
						</div> <!-- /painel -->
					</div> <!-- /col-md -->
					<!-- NOTAS PROVA -->
					<div class="col-md-4">
						<div class="panel panel-default">
							<h4>Notas Prova</h4>
							<table id="usersTable" name="usersTable" class="table">
								<tr data-status="primeiro">
									<th></th>
									<th>Data</th>
									<th>Notas</th>
								</tr>
								<tr data-status="primeiro">
									<td>P1</td>
									<td>29/02/2017</td>
									<td>7,1</td>
								</tr>
								<tr data-status="primeiro">
									<td>P2</td>
									<td>17/04/2017</td>
									<td>8,7</td>
								</tr>
								<tr data-status="segundo">
									<th></th>
									<th>Data</th>
									<th>Notas</th>
								</tr>
								<tr data-status="segundo">
									<td>P1</td>
									<td>28/02/2017</td>
									<td>9,1</td>
								</tr>
								<tr data-status="terceiro">
									<th></th>
									<th>Data</th>
									<th>Notas</th>
								</tr>
								<tr data-status="terceiro">
									<td>P1</td>
									<td>01/03/2017</td>
									<td>6,4</td>
								</tr>
								<tr data-status="quarto">
									<th></th>
									<th>Data</th>
									<th>Notas</th>
								</tr>
								<tr data-status="quarto">
									<td>P1</td>
									<td>13/02/2017</td>
									<td>10,0</td>
								</tr>
								<tr data-status="quinto">
									<th></th>
									<th>Data</th>
									<th>Notas</th>
								</tr>
								<tr data-status="quinto">
									<td>P1</td>
									<td>20/02/2017</td>
									<td>5,0</td>
								</tr>
							</table>
						</div> <!-- /painel -->
					</div> <!-- /col-md -->
					<!-- NOTAS TRABALHO -->
					<div class="col-md-3">
						<div class="panel panel-default">
							<h4>Notas Trabalho</h4>
							<table id="usersTable" name="usersTable" class="table">
								<tr data-status="primeiro">
									<th></th>
									<th>Data</th>
									<th>Notas</th>
								</tr>
								<tr data-status="primeiro">
									<td>T1</td>
									<td>14/02/2017</td>
									<td>9,1</td>
								</tr>
								<tr data-status="segundo">
									<th></th>
									<th>Data</th>
									<th>Notas</th>
								</tr>
								<tr data-status="segundo">
									<td>T1</td>
									<td>19/02/2017</td>
									<td>8,8</td>
								</tr>
								<tr data-status="terceiro">
									<th></th>
									<th>Data</th>
									<th>Notas</th>
								</tr>
								<tr data-status="terceiro">
									<td>T1</td>
									<td>14/04/2017</td>
									<td>0,0</td>
								</tr>
								<tr data-status="quarto">
									<th></th>
									<th>Data</th>
									<th>Notas</th>
								</tr>
								<tr data-status="quarto">
									<td>T1</td>
									<td>14/02/2017</td>
									<td>9,1</td>
								</tr>
								<tr data-status="quarto">
									<td>T2</td>
									<td>10/04/2017</td>
									<td>8,7</td>
								</tr>
								<tr data-status="quinto">
									<th></th>
									<th>Data</th>
									<th>Notas</th>
								</tr>
								<tr data-status="quinto">
									<td>T1</td>
									<td>20/02/2017</td>
									<td>6,2</td>
								</tr>
							</table>
						</div> <!-- /painel -->
					</div> <!-- /col-md -->
				</div> <!-- /col-md-geral -->

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
				</div><!-- /row -->
			</div><!-- /container -->
		</div><!-- /footerwrap -->

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="../assets/js/bootstrap.min.js"></script>
		<script src="../assets/js/retina-1.1.0.js"></script>
		<script src="../assets/js/jquery.hoverdir.js"></script>
		<script src="../assets/js/jquery.hoverex.min.js"></script>
		<script src="../assets/js/jquery.prettyPhoto.js"></script>
		<script src="../assets/js/jquery.isotope.min.js"></script>
		<script src="../assets/js/discente/report-card.js"></script>
        <script src="../assets/js/secretaria/home.js"></script>
		<script src="../assets/js/custom.js"></script>

	</body>
</html>
