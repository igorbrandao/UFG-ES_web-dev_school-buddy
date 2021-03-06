<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="pt-BR">
	<head>
		<link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicon/favicon-32x32.png">
		<meta charset="utf-8">

		<title>School Buddy</title>

        <link href="assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
	</head>
	<body>

    	<!-- FIXED TOP NAVBAR -->

		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">[Nome da Escola]</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<form action="Login" method="post" class="navbar-form navbar-right">
						<span class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input id="enrollment" type="number" class="form-control" name="enrollment" placeholder="Sua Matrícula">
						</span>
						<span class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input id="password" type="password" class="form-control" name="password" placeholder="Sua Senha">
						</span>
						<button id="loginbtn" type="button" onclick="attemptLogin()" class="btn btn-primary">Entrar</button>
					</form>
				</div>
			</div>
		</nav>

		<!-- BLUE WRAP -->

		<div id="blue">
			<div class="container-fluid">
				<div class="row">
					<h3>Seja Bem Vindo ao School Buddy - [Nome da Escola]</h3>
				</div><!-- /row -->
			</div><!-- /container-fluid -->
		</div><!-- /blue -->

		<!-- MAIN CONTENT -->

        <div id=loginResult>

        </div>

		<div class="container mtb">
			<div class="row">
				<div class="col-lg-8">
					<h3>O que temos para você?</h3>
					<div class="hline">

					</div>
					<br>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Aluno</h3>
						</div>
						<div class="panel-body">
						    Confira suas notas finais/parciais em avaliações e trabalhos e observe datas de entregas/acontecimentos importantes.
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Professor</h3>
						</div>
						<div class="panel-body">
						    Registre os conceitos de seus alunos e monte o calendário acadêmico de sua(s) disciplina(s).
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Responsável</h3>
						</div>
						<div class="panel-body">
						    Acompanhe o desempenho de seus entes.
						</div>
					</div>
				</div><!-- /col-lg-8 -->
				<div class="col-lg-4">
					<h3>Esqueceu a senha?</h3>
					<div class="hline"></div>
					<p>Recupere sua senha pelo guia logo abaixo.</p>
					<br>
					<p><a href="#" class="btn btn-warning" role="button">Recuperar Senha</a>
				</div><!-- /col-lg-4 -->
			</div><!-- /row -->
		</div><!-- /container -->

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

		<script src="assets/js/jquery-3.1.0.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/sign-in.js"></script>

	</body>
</html>
