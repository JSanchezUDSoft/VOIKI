<!-- 
* Copyright 2018 Carlos Eduardo Alfaro Orellana
  https://www.youtube.com/c/CarlosAlfaro007

-->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Registrar pelicula</title>
	<link rel="stylesheet" href="recursos/css/normalize.css">
	<link rel="stylesheet" href="recursos/css/sweetalert2.css">
	<link rel="stylesheet" href="recursos/css/material.min.css">
	<link rel="stylesheet" href="recursos/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="recursos/css/jquery.mCustomScrollbar.css">
	<link rel="stylesheet" href="recursos/css/main.css">
	<script src="recursos/js/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="recursos/js/jquery-1.11.2.min.js"><\/script>')</script>
	<script src="recursos/js/material.min.js" ></script>
	<script src="recursos/js/sweetalert2.min.js" ></script>
	<script src="recursos/js/jquery.mCustomScrollbar.concat.min.js" ></script>
	<script src="recursos/js/main.js" ></script>
</head>
<body>
	<!-- Notifications area -->
	<!-- navLateral -->
	<section class="full-width navLateral">
		<div class="full-width navLateral-bg btn-menu"></div>
		<div class="full-width navLateral-body">
			<div class="full-width navLateral-body-logo text-center tittles">
				<i class="zmdi zmdi-close btn-menu"></i> CINE JUNGLA
			</div>
			<figure class="full-width navLateral-body-tittle-menu">
				<div>
					<img src="recursos/css/img/avatar-male.png" alt="Avatar" class="img-responsive">
				</div>
				<figcaption>
					<span>
						<small>Director</small>
					</span>
				</figcaption>
			</figure>
			<nav class="full-width">
				<ul class="full-width list-unstyle menu-principal">
					<li class="full-width">
						<a href="#!" class="full-width btn-subMenu">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-camera-alt"></i>
							</div>
							<div class="navLateral-body-cr">
								FUNCIONES
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
							<li class="full-width">
								<a href="Controlador?accion=registrarFuncion" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-tv-play"></i>
									</div>
									<div class="navLateral-body-cr">
										REGISTRAR FUNCION
									</div>
								</a>
							</li>
							<li class="full-width">
								<a href="Controlador?accion=consultarFuncionD" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-tv-list"></i>
									</div>
									<div class="navLateral-body-cr">
										CONSULTAR FUNCION
									</div>
								</a>
							</li>
						</ul>
					</li>
					<li class="full-width divider-menu-h"></li>
					<li class="full-width">
						<a href="#!" class="full-width btn-subMenu">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-camera"></i>
							</div>
							<div class="navLateral-body-cr">
								PELICULAS
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
							<li class="full-width">
								<a href="Controlador?accion=registrarPelicula" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-camera-roll"></i>
									</div>
									<div class="navLateral-body-cr">
										REGISTRAR PELICULA
									</div>
								</a>
							</li>
							<li class="full-width">
								<a href="client.html" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-videocam-off"></i>
									</div>
									<div class="navLateral-body-cr">
										INHABILITAR PELICULA
									</div>
								</a>
							</li>
						</ul>
					</li>
					<li class="full-width divider-menu-h"></li>
					<li class="full-width">
						<a href="#!" class="full-width btn-subMenu">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-star"></i>
							</div>
							<div class="navLateral-body-cr">
								GESTIÓN DE MULTIPLEX
							</div>
							<span class="zmdi zmdi-chevron-left"></span>
						</a>
						<ul class="full-width menu-principal sub-menu-options">
							<li class="full-width">
								<a href="Controlador?accion=registrarSala" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-cast"></i>
									</div>
									<div class="navLateral-body-cr">
										REGISTRAR SALA
									</div>
								</a>
							</li>
							<li class="full-width">
								<a href="Controlador?accion=registrarMultiplex" class="full-width">
									<div class="navLateral-body-cl">
										<i class="zmdi zmdi-star-circle"></i>
									</div>
									<div class="navLateral-body-cr">
										REGISTRAR MULTIPLEX
									</div>
								</a>
							</li>
						</ul>
					</li>
					<li class="full-width divider-menu-h"></li>
					<li class="full-width">
						<a href="Controlador?accion=registrarUsuario" class="full-width">
							<div class="navLateral-body-cl">
								<i class="zmdi zmdi-accounts-alt"></i>
							</div>
							<div class="navLateral-body-cr">
								REGISTRAR EMPLEADO
							</div>
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</section>
	<!-- pageContent -->
	<section class="full-width pageContent">
		<!-- navBar -->
		<div class="full-width navBar">
			<div class="full-width navBar-options">
				<i class="zmdi zmdi-swap btn-menu" id="btn-menu"></i>
				<div class="mdl-tooltip" for="btn-menu">Hide / Show MENU</div>
				<nav class="navBar-options-list">
					<ul class="list-unstyle">
						<li class="btn-exit" id="btn-exit">
							<i class="zmdi zmdi-power"></i>
							<div class="mdl-tooltip" for="btn-exit">LogOut</div>
						</li>
						<li class="text-condensedLight noLink" ><small>User Name</small></li>
						<li class="noLink">
							<figure>
								<img src="recursos/css/img/avatar-male.png" alt="Avatar" class="img-responsive">
							</figure>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<div class="full-width divider-menu-h"></div>
		<div class="mdl-grid">
			<div class="mdl-cell mdl-cell--12-col">
				<div class="full-width panel mdl-shadow--2dp">
					<div class="full-width panel-tittle bg-primary text-center tittles">
						Nueva pelicula
					</div>
					<div class="full-width panel-content">
						<form action="Controlador">
							<div class="mdl-grid">
								<div class="mdl-cell mdl-cell--12-col">
		                            <legend class="text-condensedLight"><i class="zmdi zmdi-border-color"></i> &nbsp; DATOS DE LA PELÍCULA</legend><br>
		                        </div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="text" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="titulo" name="titulo">
										<label class="mdl-textfield__label" for="titulo">Título</label>
										<span class="mdl-textfield__error">Invalid name</span>
									</div>
								</div>
								<div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<select name="genero" id="genero" class="mdl-textfield__input">
											<option value="">Seleccione el género</option>
                                            <option name="genero" value="infantil">Infantil</option>
                                            <option name="genero" value="terror">Terror</option>
                                            <option name="genero" value="comedia">Comedia</option>
                                            <option name="genero" value="aventura">Aventura</option>
                                            <option name="genero" value="ciencia ficcion">Ciencia Ficción</option>
                                            <option name="genero" value="fantasia">Fantasia</option>
										</select>
									</div>
								</div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="number" min="1900" max="2099" step="1" id="anoEstreno" name="estreno"/>
										<label class="mdl-textfield__label" for="anoestreno">Año de estreno</label>
										<span class="mdl-textfield__error">Año incorrecto</span>
									</div>
								</div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="time" id="duracion" step='1' min="00:00:00" max="20:00:00" name="duracion"/>
										<label class="mdl-textfield__label" for="duracion">Duración</label>
										<span class="mdl-textfield__error">Invalid name</span>
									</div>
								</div>
							</div>
							<p class="text-center">
								<button type="submit" name="accion" value="registrarPelicula" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-addFuncion">
									<i class="zmdi zmdi-plus"></i>
								</button>
								<div class="mdl-tooltip" for="btn-addCompany">Registrar película</div>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>