<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="pt-BR">
	<head>
		<link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicon/favicon-32x32.png">
		<meta name="msapplication-TileColor" content="#ffffff">
		<meta name="theme-color" content="#ffffff">
		<meta charset="utf-8">

		<title>Lista Usuários</title>

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
					<h3>Usuários - Lista</h3>
				</div><!-- /row -->
			</div><!-- /container-fluid -->
		</div><!-- /blue -->

		<!-- CONTENT -->

		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="pull-left">
							<h4>Filtros</h4>
						</div>
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-info btn-filter" data-target="aluno">Alunos</button>
								<button type="button" class="btn btn-success btn-filter" data-target="professor">Professores</button>
								<button type="button" class="btn btn-default btn-filter" data-target="all">Todos</button>
							</div>
						</div>
					</div>
				</div>
				<div id=queryResult>

				</div>
				<div class="well">
					<table id="usersTable" name="usersTable" class="table">
						<thead>
							<tr data-status="all">
								<th>Matrícula</th>
								<th>Tipo</th>
								<th>Nome</th>
								<th>Email</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3 col-md-offset-1">
				<nav>
					<ul class="pagination">

					</ul>
				</nav>
			</div>
			<br>
		</div>

		<!-- MODAL ALUNO -->

		<div class="modal fade" id="edit-aluno" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="editModalTitle-aluno"></h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<span class="col-lg-1">
								<label for="Email-aluno">Email</label>
							</span>
							<span class="col-lg-3 col-lg-offset-3">
								<label for="Name-aluno" class="">Nome Completo</label>
							</span>
						</div>
						<div class="row">
							<span class="col-lg-4">
								<input type="email" class="form-control" id="email-aluno">
							</span>
							<span class="col-lg-4">
								<input type="text" class="form-control" id="name-aluno">
							</span>
						</div>
						<br>
						<div class="row">
							<span class="col-lg-2">
								<label for="Address-aluno">Endereço</label>
							</span>
							<span class="col-lg-2 col-lg-offset-2">
								<label for="Phone-aluno" class="">Telefone</label>
							</span>
						</div>
						<div class="row">
							<span class="col-lg-4">
								<input type="text" class="form-control" id="address-aluno">
							</span>
							<span class="col-lg-4">
								<input type="text" class="form-control" id="phone-aluno">
							</span>
						</div>
						<br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        				<button type="button" onClick="updateUser()" class="btn btn-primary" data-dismiss="modal">Salvar Modificações</button>
					</div>
				</div>
			</div>
		</div>

		<!-- MODAL PROFESSOR -->

		<div class="modal fade" id="edit-professor" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="editModalTitle-professor"></h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<span class="col-lg-1">
								<label for="Email-professor">Email</label>
							</span>
							<span class="col-lg-3 col-lg-offset-3">
								<label for="Name-professor" class="">Nome Completo</label>
							</span>
						</div>
						<div class="row">
							<span class="col-lg-4">
								<input type="email" class="form-control" id="email-professor" name="email-professor">
							</span>
							<span class="col-lg-4">
								<input type="text" class="form-control" id="name-professor" name="name-professor">
							</span>
						</div>
						<br>
						<div class="row">
							<span class="col-lg-2">
								<label for="Address-professor">Endereço</label>
							</span>
							<span class="col-lg-2 col-lg-offset-2">
								<label for="Phone-professor" class="">Telefone</label>
							</span>
						</div>
						<div class="row">
							<span class="col-lg-4">
								<input type="text" class="form-control" id="address-professor" name="address-professor">
							</span>
							<span class="col-lg-4">
								<input type="text" class="form-control" id="phone-professor" name="phone-professor">
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
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
						<button type="button" onClick="updateUser()" class="btn btn-primary" data-dismiss="modal">Salvar Modificações</button>
					</div>
				</div>
			</div>
		</div>

		<!-- MODAL DELEÇÃO -->

		<div class="modal fade" id="deleteUser" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="deleteModalTitle"></h4>
					</div>
					<div class="modal-body">
						<p id="deletingUserInfo"></p>
						<p><b>Apagar um usuário é uma ação irreversível. Deseja prosseguir?</b></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        				<button type="button" onClick="deleteUser()" class="btn btn-danger" data-dismiss="modal">Apagar Usuário</button>
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
		<script src="../assets/js/secretaria/all-users.js"></script>

	</body>
</html>
