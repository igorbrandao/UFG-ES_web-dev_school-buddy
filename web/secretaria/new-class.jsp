<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="pt-BR">
	<head>
		<link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicon/favicon-32x32.png">
		<meta name="msapplication-TileColor" content="#ffffff">
		<meta name="theme-color" content="#ffffff">
		<meta charset="utf-8">

		<title>Nova Turma</title>

        <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="../assets/css/bootstrap.css" rel="stylesheet">
        <link href="../assets/css/style.css" rel="stylesheet">
        <link href="../assets/css/secretaria/new-class.css" rel="stylesheet">

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
					<h3>Cadastro de Nova Turma</h3>
				</div><!-- /row -->
			</div><!-- /container-fluid -->
		</div><!-- /blue -->

		<!-- CONTENT -->

        <div class="container">
            <div class="row">
                <div class="wizard">
                    <div class="wizard-inner">
                        <div class="connecting-line"></div>
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Início">
                                <span class="round-tab">
                                <i class="fa fa-sliders"></i>
                                </span>
                                </a>
                            </li>
                            <li role="presentation" class="disabled">
                                <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Professores e Disciplinas">
                                <span class="round-tab">
                                <i class="fa fa-university"></i>
                                </span>
                                </a>
                            </li>
                            <li role="presentation" class="disabled">
                                <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Alunos">
                                <span class="round-tab">
                                <i class="fa fa-user-plus"></i>
                                </span>
                                </a>
                            </li>
                            <li role="presentation" class="disabled">
                                <a href="#step4" data-toggle="tab" aria-controls="step4" role="tab" title="Revisão">
                                <span class="round-tab">
                                <i class="fa fa-chevron-left"></i>
                                </span>
                                </a>
                            </li>
                            <li role="presentation" class="disabled">
                                <a href="#step5" data-toggle="tab" aria-controls="step5" role="tab" title="Completo">
                                <span class="round-tab">
                                <i class="fa fa-check"></i>
                                </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" role="tabpanel" id="step1">
                            <h4>Configuração Inicial</h4>
							<br>
        					<p>Crie uma turma para os alunos (máximo de 50) de sua escola com uma ou mais disciplinas (máximo de 10).</p>
							<br>
    						<div>
								<div class="row">
									<span class="col-lg-3 pull-left">
										<label for="ClassName" class="">Nome da Turma</label>
									</span>
									<span class="col-lg-3 col-lg-offset-1 pull-left">
										<label for="TotalStudents" class="">Total de Alunos</label>
									</span>
									<span class="col-lg-3 pull-left">
										<label for="TotalSubjects" class="">Quantidade de Disciplinas</label>
									</span>
								</div>
								<div class="row">
									<span class="col-lg-3">
										<input type="text" class="form-control" id="className" name="className">
									</span>
									<span class="col-lg-1 col-lg-offset-1">
										<input type="number" min="1" max="50" class="form-control" id="totalStudents" name="totalStudents">
									</span>
									<span class="col-lg-1 col-lg-offset-2">
										<input type="number" min="1" max="10" class="form-control" id="totalSubjects" name="totalSubjects">
									</span>
								</div>
    						</div>
                            <ul class="list-inline pull-right">
                                <li><button type="button" class="btn btn-primary btn-info-full next-step">Prosseguir</button></li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="step2">
                            <h4>Definição de Disciplinas e Professores</h4>
							<br>
        					<p>Defina quais disciplinas essa turma fornecerá e quais professores as ministrarão.</p>
							<br>
    						<div id="step2div">

    						</div>
                            <ul class="list-inline pull-right">
                                <li><button type="button" class="btn btn-default prev-step">Voltar</button></li>
                                <li><button type="button" class="btn btn-primary btn-info-full next-step">Prosseguir</button></li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="step3">
							<br>
                            <h4>Adicionar Estudantes</h4>
        					<p>Adicione alunos já matriculados no sistema à esta turma usando o número de matrícula de cada um.</p>
							<br>
    						<div id="step3div">

    						</div>
                            <ul class="list-inline pull-right">
                                <li><button type="button" class="btn btn-default prev-step">Voltar</button></li>
                                <li><button type="button" class="btn btn-primary btn-info-full next-step">Prosseguir</button></li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="step4">
                            <h4>Revisão</h4>
							<br>
        					<p>Confira os dados da turma que você está prestes a criar logo abaixo.</p>
							<br>
    						<div id="step4div">

    						</div>
                            <ul class="list-inline pull-right">
                                <li><button type="button" class="btn btn-warning prev-step">Tem algo Errado...</button></li>
                                <li><button type="button" class="btn btn-success btn-info-full next-step">Criar Nova Turma</button></li>
                            </ul>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="step5">
                            <h3>Turma criada</h3>
							<br>
                            <p>Uma nova turma com as informações fornecidas foi cadastrada.</p>
							<br>
							<button type="button" onclick="window.location.reload();" class="btn btn-theme btn pull-right">Criar Outra Turma</button>
							<br>
                        </div>
                    </div>
                </div>
				<br>
				<hr>
				<div id="invalidForm">

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
		<script src="../assets/js/secretaria/new-class.js"></script>

	</body>
</html>
