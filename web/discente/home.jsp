﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="pt-BR">
	<head>
		<link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicon/favicon-32x32.png">
        <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="../assets/css/bootstrap.css" rel="stylesheet">
        <link href="../assets/css/style.css" rel="stylesheet">
		<meta charset="utf-8">
		<title>Home</title>
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
						<h3>Olá, [Nome do Aluno]. Essa é a sua Home!</h3>
						<h5>Com a visão geral da sua grade anual, disciplinas cadastradas, notas e presenças nas respctivas disciplinas, além do seu boletim bimestral.</h5>
					</div>
				</div><!-- /row -->
			</div><!-- /container-fluid -->
		</div><!-- /blue -->

		<!-- SERVICE LOGOS -->

		<div id="service">
			<div class="container">
				<div class="row centered">
					<div class="col-md-6">
						<a href="class.jsp"><i class="fa fa-graduation-cap"></i></a>
						<a href="class.jsp"><h4>Turma</h4></a>
						<p>Informações sobre as disciplinas do seu atual ano letivo. Fique por dentro dos trabalhos, atividades e avaliações, e acompanhe seu desempenho.</p>
					</div>
					<div class="col-md-6">
						<a href="report-card.jsp"><i class="glyphicon glyphicon-list-alt"></i></a>
						<a href="report-card.jsp"><h4>Boletim</h4></a>
						<p>Visualize seu boletim bimestral ou final.</p>
					</div>
				</div>
			</div><!--/container -->
		</div><!--/service -->

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
		<script src="../assets/js/custom.js"></script>

	</body>
</html>
