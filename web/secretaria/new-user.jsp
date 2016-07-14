<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="pt-BR">
	<head>
		<link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicon/favicon-32x32.png">
		<meta name="msapplication-TileColor" content="#ffffff">
		<meta name="theme-color" content="#ffffff">
		<meta charset="utf-8">

		<title>Novo Usuário</title>

        <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="../assets/css/bootstrap.css" rel="stylesheet">
        <link href="../assets/css/style.css" rel="stylesheet">
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
    						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Administrador <b class="caret"></b></a>
    						<ul class="dropdown-menu">
    							<li><a href="new-user.jsp">Cadastrar Usuário</a></li>
								<li><a href="edit-user.jsp">Modificar Usuário</a></li>
								<li><a href="new-class.jsp">Cadastrar Turma</a></li>
								<li><a href="edit-class.jsp">Modificar Turma</a></li>
    							<li class="divider"></li>
    							<li><a href="../sign-in.jsp" >Sair  <i class="fa fa-sign-out" aria-hidden="true"></i></a></li>
    						</ul>
    					</li>
    				</ul>
    			</div><!-- /.navbar-collapse -->
    		</div><!-- /.container-fluid -->
    	</nav>

		<!-- BLUE WRAP -->

		<div id="blue">
			<div class="container-fluid">
				<div class="row">
					<h3>Cadastro de Novo Usuário</h3>
				</div><!-- /row -->
			</div><!-- /container-fluid -->
		</div><!-- /blue -->

		<!-- CREATION FORMS -->

		<div class="container mtb">
			<div class="row">
				<div class="col-lg-8">
					<h4>Crie uma nova conta</h4>
					<div class="hline">

					</div>
					<p>Aqui você pode criar uma conta para fazer uso do School Buddy. Comece selecionando o tipo de conta.</p>
					<form role="form">
						<div class="row">
							<span class="col-lg-2 dropdown">
								<button href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Tipo <b class="caret"></b></button>
								<ul class="dropdown-menu">
									<li><a onclick="switchForm('Aluno')" href="#">Aluno</a></li>
									<li><a onclick="switchForm('Professor')" href="#">Professor</a></li>
									<li><a onclick="switchForm('Responsavel')" href="#">Responsável</a></li>
								</ul>
							</span>
							<span class="col-lg-6">
							<input class="form-control" type="text" id="type" placeholder="selecione" disabled="disabled">
							</span>
						</div>
						<br>
						<div id="forms">
                            <!-- Forms injetados pelo js -->
						</div>
						<br>
						<div class="row">
							<span class="col-lg-offset-7 col-lg-1">
							<button id="create" type="button" data-toggle="modal" data-target="#creationSucess" class="btn btn-info" style="float: right;" disabled>Criar Novo Usuário</button>
							</span>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="creationSucess" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">Usuário Criado!</h4>
									</div>
									<div class="modal-body">
										<p>Essa conta está pronta para uso. Matrícula e senha foram enviados para o endereço de email informado no momento do cadastro.</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-info" data-dismiss="modal">Entendi</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="col-lg-4">
					<h4>Foto</h4>
					<div class="hline">

					</div>
					<br>
					<div class="thumbnail">
						<img src="../assets/img/placeholder.png" alt="Foto de Perfil">
						<div class="caption">
							<h3>Foto de Perfil</h3>
							<p>Faça o upload de uma imagem para perfil do usuário usando o botão abaixo.</p>
							<p><a href="#" class="btn btn-primary" role="button" disabled>Upload</a>
						</div>
					</div>
				</div>
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

		<script src="../assets/js/jquery-3.1.0.min.js"></script>
		<script src="../assets/js/bootstrap.min.js"></script>
		<script src="../assets/js/secretaria/new-user.js"></script>

	</body>
</html>
