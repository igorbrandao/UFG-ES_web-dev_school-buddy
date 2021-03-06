<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="pt-BR">
	<head>
		<link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicon/favicon-32x32.png">
		<meta name="msapplication-TileColor" content="#ffffff">
		<meta name="theme-color" content="#ffffff">
		<meta charset="utf-8">

		<title>Lista Turmas</title>

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
					<h3>Turmas - Lista</h3>
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
								<button type="button" class="btn btn-success btn-filter" data-target="closed">Encerrada</button>
								<button type="button" class="btn btn-primary btn-filter" data-target="open">Aberta</button>
								<button type="button" class="btn btn-default btn-filter" data-target="all">Todas</button>
							</div>
						</div>
					</div>
				</div>
				<div id=queryResult>

				</div>
				<div class="well">
					<table id="classesTable" name="classesTable" class="table">
						<thead>
							<tr data-status="all">
								<th>Turma</th>
								<th>N° Alunos</th>
								<th>N° Disciplinas</th>
								<th>Ativa</th>
							</tr>
						</thead>
						<tbody>
							<tr data-status="open" id="1">
								<td>1° Ano A</td>
								<td>10</td>
								<td>2</td>
								<td><input type="checkbox" checked value="true" disabled></td>
								<td>
									<a href="#detailClass" role="button" data-toggle="modal"><i id="1" class="glyphicon glyphicon-option-vertical"></i></a>
									<a href="#deleteClass" role="button" data-toggle="modal"><i id="1" class="glyphicon glyphicon-remove"></i></a>
								</td>
							</tr>
							<tr data-status="open" id="2">
								<td>1° Ano B</td>
								<td>14</td>
								<td>3</td>
								<td><input type="checkbox" checked value="true" disabled></td>
								<td>
									<a href="#detailClass" role="button" data-toggle="modal"><i id="2" class="glyphicon glyphicon-option-vertical"></i></a>
									<a href="#deleteClass" role="button" data-toggle="modal"><i id="2" class="glyphicon glyphicon-remove"></i></a>
								</td>
							</tr>
							<tr data-status="closed" id="3">
								<td>2° Ano A</td>
								<td>31</td>
								<td>7</td>
								<td><input type="checkbox" value="false" disabled></td>
								<td>
									<a href="#detailClass" role="button" data-toggle="modal"><i id="3" class="glyphicon glyphicon-option-vertical"></i></a>
									<a href="#deleteClass" role="button" data-toggle="modal"><i id="3" class="glyphicon glyphicon-remove"></i></a>
								</td>
							</tr>
							<tr data-status="closed" id="4">
								<td>3° Ano A</td>
								<td>22</td>
								<td>4</td>
								<td><input type="checkbox" disabled></td>
								<td>
									<a href="#detailClass" role="button" data-toggle="modal"><i id="4" class="glyphicon glyphicon-option-vertical"></i></a>
									<a href="#deleteClass" role="button" data-toggle="modal"><i id="4" class="glyphicon glyphicon-remove"></i></a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3 col-md-offset-1">
				<nav>
					<ul class="pagination">
						<li>
							<a href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li>
							<a href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
			<br>
		</div>

		<!-- MODAL DETALHES DA TURMA -->

		<div class="modal fade bs-example-modal-lg" id="detailClass" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="detailModalTitle"></h4>
					</div>
					<div class="modal-body">
						<div id=subjectsDiv>

						</div>
						<hr>
						<div id=studentsDiv>

						</div>
						<br>
					</div>
					<br>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
					</div>
				</div>
			</div>
		</div>

		<!-- MODAL DELEÇÃO -->

		<div class="modal fade" id="deleteClass" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="deleteModalTitle"></h4>
					</div>
					<div class="modal-body">
						<p id="deletingClassInfo"></p>
						<p><b>Apagar uma classe é uma ação irreversível. Deseja prosseguir?</b></p>
					</div>
					<br>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        				<button type="button" onClick="deleteClass()" class="btn btn-danger" data-dismiss="modal">Apagar Turma</button>
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
		<script src="../assets/js/secretaria/all-classes.js"></script>

	</body>
</html>
