<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="pt-BR">
	<head>
		<link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicon/favicon-32x32.png">
		<meta name="msapplication-TileColor" content="#ffffff">
		<meta name="theme-color" content="#ffffff">
		<meta charset="utf-8">

		<title>Editar Usuário</title>

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
					<h3>Edição de Usuário</h3>
				</div><!-- /row -->
			</div><!-- /container-fluid -->
		</div><!-- /blue -->

		<!-- CREATION FORMS -->

		<div class="container mtb">
			<div class="row">
				<div class="col-lg-8">
					<h4>Modifique informações de conta</h4>
					<div class="hline">

					</div>
					<p>Aqui você pode alterar/atualizar os dados de uma conta. Basta informar o número de matrícula.</p>
					<form role="form">
						<div class="row">
                			<span class="col-lg-3">
                				<label for="Enrollment">Número de Matrícula</label>
                			</span>
						</div>
						<div class="row">
							<span class="col-lg-4">
							<input class="form-control" type="number" id="enrollment" name="enrollment" placeholder="Matrícula">
							</span>
							<span class="col-lg-offset-1 col-lg-1">
                                <button id="find" type="button" class="btn btn-info" style="float: right;">Encontrar Usuário</button>
							</span>
						</div>
						<br>
						<div id=queryResult>

						</div>
					</form>
				</div>
				<div class="col-lg-4">
					<h4>Listagem</h4>
					<div class="hline">

					</div>
					<p>Se não souber a matrícula, não tem problema. Use a visão geral de todos os usuários.</p>
					<p><a id="list" href="all-users.jsp" class="btn btn-info" style="float: left;">Todos os Usuários</a></p>
				</div>

				<!-- MODAL ALUNO -->

				<div class="modal fade" id="edit-discente" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title"></h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<span class="col-lg-1">
										<label for="Email-discente">Email</label>
									</span>
									<span class="col-lg-3 col-lg-offset-3">
										<label for="Name-discente" class="">Nome Completo</label>
									</span>
								</div>
								<div class="row">
									<span class="col-lg-4">
										<input type="email" class="form-control" id="email-discente" name="email">
									</span>
									<span class="col-lg-4">
										<input type="text" class="form-control" id="name-discente" name="name">
									</span>
								</div>
								<br>
								<div class="row">
									<span class="col-lg-2">
										<label for="Address-discente">Endereço</label>
									</span>
									<span class="col-lg-2 col-lg-offset-2">
										<label for="Phone-discente" class="">Telefone</label>
									</span>
								</div>
								<div class="row">
									<span class="col-lg-4">
										<input type="text" class="form-control" id="address-discente" name="address">
									</span>
									<span class="col-lg-4">
										<input type="text" class="form-control" id="phone-discente" name="phone">
									</span>
								</div>
								<br>
							</div>
							<div class="modal-footer">
								<button type="button" onClick="showAlert('delete', 'alert-info')" class="btn btn-danger pull-left" data-dismiss="modal">Apagar Usuário</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
		        				<button type="button" onClick="showAlert('update', 'alert-success')" class="btn btn-primary" data-dismiss="modal">Salvar Modificações</button>
							</div>
						</div>
					</div>
				</div>

				<!-- MODAL PROFESSOR -->

				<div class="modal fade" id="edit-docente" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title"></h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<span class="col-lg-1">
										<label for="Email-docente">Email</label>
									</span>
									<span class="col-lg-3 col-lg-offset-3">
										<label for="Name-docente" class="">Nome Completo</label>
									</span>
								</div>
								<div class="row">
									<span class="col-lg-4">
										<input type="email" class="form-control" id="email-docente" name="email">
                                    </span>>
									<span class="col-lg-4">
										<input type="text" class="form-control" id="name-docente" name="name">
									</span>
								</div>
								<br>
								<div class="row">
									<span class="col-lg-2">
										<label for="Address-discente">Endereço</label>
									</span>
									<span class="col-lg-2 col-lg-offset-2">
										<label for="Phone-discente" class="">Telefone</label>
									</span>
								</div>
								<div class="row">
									<span class="col-lg-4">
										<input type="text" class="form-control" id="address-docente" name="address">
									</span>
									<span class="col-lg-4">
										<input type="text" class="form-control" id="phone-docente" name="phone">
									</span>
								</div>
								<br>
								<br>
								<div class="row">
									<span class="col-lg-4 text-center">
										<label for="Areas" class="">Areas de Conhecimento</label>
									</span>
									<span class="col-lg-6">
										<input type="text" class="form-control" id="areas" name="areas">
									</span>
								</div>
								<br>
							</div>
							<div class="modal-footer">
								<button type="button" onClick="showAlert('delete', 'alert-info')" class="btn btn-danger pull-left" data-dismiss="modal">Apagar Usuário</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
								<button type="button" onClick="showAlert('update', 'alert-success')" class="btn btn-primary" data-dismiss="modal">Salvar Modificações</button>
							</div>
						</div>
					</div>
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

		<script src="../assets/js/jquery-3.1.0.min.js"></script>
		<script src="../assets/js/bootstrap.min.js"></script>
		<script src="../assets/js/secretaria/edit-user.js"></script>

	</body>
</html>
