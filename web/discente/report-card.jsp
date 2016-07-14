<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="pt-BR">
	<head>
		<link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicon/favicon-32x32.png">
        <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="../assets/css/bootstrap.css" rel="stylesheet">
        <link href="../assets/css/style.css" rel="stylesheet">
		<meta charset="utf-8">
		<title>Boletim</title>
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
								<li><a href="class.jsp">Vizualizar Turma</a></li>
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
						<h3>Olá, Nome do Aluno.</h3>
						<h5>Essas são as suas notas bimestrais.</h5>
					</div>
				</div><!-- /row -->
			</div><!-- /container-fluid -->
		</div><!-- /blue -->

		<!-- CONTENT -->

		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="pull-left">
							<h4>Bimestres</h4>
						</div>
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-info btn-filter" data-target="primeiro">1° Bimestre</button>
								<button type="button" class="btn btn-success btn-filter" data-target="segundo">2° Bimestre</button>
								<button type="button" class="btn btn-primary btn-filter" data-target="terceiro">3° Bimestre</button>
								<button type="button" class="btn btn-warning btn-filter" data-target="quarto">4° Bimestre</button>
								<button type="button" class="btn btn-danger btn-filter" data-target="final">Boletim Final</button>
							</div>
						</div>
					</div>
				</div>
				<div class="well">
					<table id="usersTable" class="table">

						<!-- PRIMEIRO BIMESTRE -->

						<tr data-status="primeiro">
							<th>Disciplina</th>
							<th>Professor</th>
							<th>N1</th>
							<th>N2</th>
							<th>Média 1° Bimestre</th>
						</tr>
						<tr data-status="primeiro">
							<td>Português</td>
							<td>Marcos</td>
							<td>9,1</td>
							<td>9,3</td>
							<td>9,2</td>
						</tr>
						<tr data-status="primeiro">
							<td>Matemática</td>
							<td>Tiago</td>
							<td>6,3</td>
							<td>8,5</td>
							<td>7,4</td>
						</tr>
						<tr data-status="primeiro">
							<td>Ciências</td>
							<td>Marina</td>
							<td>7.1</td>
							<td>6,3</td>
							<td>6,7</td>
						</tr>
						<tr data-status="primeiro">
							<td>História</td>
							<td>Letícia</td>
							<td>9,1</td>
							<td>9.3</td>
							<td>9,2</td>
						</tr>
						<tr data-status="primeiro">
							<td>Geografia</td>
							<td>Kellen</td>
							<td>8,0</td>
							<td>7,0</td>
							<td>7,5</td>
						</tr>

						<!-- SEGUNDO BIMESTRE -->

						<tr data-status="segundo">
							<th>Disciplina</th>
							<th>Professor</th>
							<th>N1</th>
							<th>N2</th>
							<th>Média 2° Bimestre</th>
						</tr>
						<tr data-status="segundo">
							<td>Português</td>
							<td>Marcos</td>
							<td>9,1</td>
							<td>9,3</td>
							<td>9,2</td>
						</tr>
						<tr data-status="segundo">
							<td>Matemática</td>
							<td>Tiago</td>
							<td>6,3</td>
							<td>8,5</td>
							<td>7,4</td>
						</tr>
						<tr data-status="segundo">
							<td>Ciências</td>
							<td>Marina</td>
							<td>7.1</td>
							<td>6,3</td>
							<td>6,7</td>
						</tr>
						<tr data-status="segundo">
							<td>História</td>
							<td>Letícia</td>
							<td>9,1</td>
							<td>9.3</td>
							<td>9,2</td>
						</tr>
						<tr data-status="segundo">
							<td>Geografia</td>
							<td>Kellen</td>
							<td>8,0</td>
							<td>7,0</td>
							<td>7,5</td>
						</tr>

						<!-- TERCEIRO BIMESTRE -->

						<tr data-status="terceiro">
							<th>Disciplina</th>
							<th>Professor</th>
							<th>N1</th>
							<th>N2</th>
							<th>Média 3° Bimestre</th>
						</tr>
						<tr data-status="terceiro">
							<td>Português</td>
							<td>Marcos</td>
							<td>9,1</td>
							<td>9,3</td>
							<td>9,2</td>
						</tr>
						<tr data-status="terceiro">
							<td>Matemática</td>
							<td>Tiago</td>
							<td>6,3</td>
							<td>8,5</td>
							<td>7,4</td>
						</tr>
						<tr data-status="terceiro">
							<td>Ciências</td>
							<td>Marina</td>
							<td>7.1</td>
							<td>6,3</td>
							<td>6,7</td>
						</tr>
						<tr data-status="terceiro">
							<td>História</td>
							<td>Letícia</td>
							<td>9,1</td>
							<td>9.3</td>
							<td>9,2</td>
						</tr>
						<tr data-status="terceiro">
							<td>Geografia</td>
							<td>Kellen</td>
							<td>8,0</td>
							<td>7,0</td>
							<td>7,5</td>
						</tr>

						<!-- QUARTO BIMESTRE -->

						<tr data-status="quarto">
							<th>Disciplina</th>
							<th>Professor</th>
							<th>N1</th>
							<th>N2</th>
							<th>Média 4° Bimestre</th>
						</tr>
						<tr data-status="quarto">
							<td>Português</td>
							<td>Marcos</td>
							<td>9,1</td>
							<td>9,3</td>
							<td>9,2</td>
						</tr>
						<tr data-status="quarto">
							<td>Matemática</td>
							<td>Tiago</td>
							<td>6,3</td>
							<td>8,5</td>
							<td>7,4</td>
						</tr>
						<tr data-status="quarto">
							<td>Ciências</td>
							<td>Marina</td>
							<td>7.1</td>
							<td>6,3</td>
							<td>6,7</td>
						</tr>
						<tr data-status="quarto">
							<td>História</td>
							<td>Letícia</td>
							<td>9,1</td>
							<td>9.3</td>
							<td>9,2</td>
						</tr>
						<tr data-status="quarto">
							<td>Geografia</td>
							<td>Kellen</td>
							<td>8,0</td>
							<td>7,0</td>
							<td>7,5</td>
						</tr>

						<!-- RESULTADO FINAL -->

						<tr data-status="final">
							<th>Disciplina</th>
							<th>1° Bimestre</th>
							<th>2° Bimestre</th>
							<th>3° Bimestre</th>
							<th>4° Bimestre</th>
							<th>Média Final</th>
						</tr>
						<tr data-status="final">
							<td>Português</td>
							<td>9,7</td>
							<td>9,1</td>
							<td>9,3</td>
							<td>9,2</td>
							<td>9,0</td>
						</tr>
						<tr data-status="final">
							<td>Matemática</td>
							<td>6,5</td>
							<td>6,3</td>
							<td>8,5</td>
							<td>7,4</td>
							<td>7,4</td>
						<tr data-status="final">
							<td>Ciências</td>
							<td>3,7</td>
							<td>7.1</td>
							<td>6,3</td>
							<td>6,7</td>
							<td>6,7</td>
						</tr>
						<tr data-status="final">
							<td>História</td>
							<td>6,7</td>
							<td>9,1</td>
							<td>9.3</td>
							<td>9,2</td>
							<td>6,7</td>
						</tr>
						<tr data-status="final">
							<td>Geografia</td>
							<td>6,7</td>
							<td>8,0</td>
							<td>7,0</td>
							<td>7,5</td>
							<td>6,7</td>
						</tr>
					</table>
					<a href="#" class="btn btn-theme">Baixar PDF</a>
				</div>
			</div>
		</div>


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
        <script src="../assets/js/secretaria/home.js"></script>
		<script src="../assets/js/discente/report-card.js"></script>
		<script src="../assets/js/custom.js"></script>

	</body>
</html>
