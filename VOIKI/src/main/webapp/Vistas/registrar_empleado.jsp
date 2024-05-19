<%@ page import="Config.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!--
* Copyright 2018 Carlos Eduardo Alfaro Orellana
  https://www.youtube.com/c/CarlosAlfaro007

-->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Registrar cliente</title>
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
						Nuevo empleado
					</div>
					<div class="full-width panel-content">
						<form action="Controlador">
							<div class="mdl-grid">
								<div class="mdl-cell mdl-cell--12-col">
		                            <legend class="text-condensedLight"><i class="zmdi zmdi-border-color"></i> &nbsp; DATOS DEL EMPLEADO</legend><br>
		                        </div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="number" pattern="-?[0-9]*([0-9])?" id="identificacion" name="identificacion">
										<label class="mdl-textfield__label" for="identificacion">Número de identificación</label>
										<span class="mdl-textfield__error">Invalid DNI</span>
									</div>
								</div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="text" pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="nombreEmpleado" name="nombreEmpleado">
										<label class="mdl-textfield__label" for="nombreEmpleado">Nombre</label>
										<span class="mdl-textfield__error">Invalid name</span>
									</div>
								</div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="tel" pattern="-?[0-9+()- ]*(\.[0-9]+)?" id="telefono" name="telefono">
										<label class="mdl-textfield__label" for="telefono">Teléfono</label>
										<span class="mdl-textfield__error">Invalid phone number</span>
									</div>
								</div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="number" id="salario" name="salario"/>
										<label class="mdl-textfield__label" for="salario">Salario</label>
										<span class="mdl-textfield__error">Salario incorrecto</span>
									</div>
								</div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<select id="idMultiplex" name="idMultiplex" class="mdl-textfield__input">
											<option value="" selected>Seleccione el multiplex</option>
											<%
												Conexion cn = new Conexion();
												Connection con;
												PreparedStatement ps;
												ResultSet rs;

												String sql = "select k_multiplex, n_multiplex from multiplex";
												try {
													con = cn.getConnection();
													ps = con.prepareStatement(sql);
													rs = ps.executeQuery();
											
													while (rs.next()) {
														out.println("<OPTION VALUE=\""+ rs.getString(1) +"\">"+ rs.getString(2) +"</OPTION>");
													}

												}catch (Exception e){
													System.out.println(e);
												}
											%>
										</select>
									</div>
								</div>
								<div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<select name="rol" class="mdl-textfield__input">
											<option value="">Seleccione el rol</option>
                                            <option value="c">Cajero</option>
                                            <option value="d">Director</option>
										</select>
									</div>
								</div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<label class="" for="fechaContrato">Seleccione la fecha de contratación</label>
										<input class="mdl-textfield__input" type="date" id="fechaContrato" name="fechaContrato">
										<span class="mdl-textfield__error">Invalid name</span>
									</div>
								</div>
                                <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <select name="cargo" id=cargo class="mdl-textfield__input">
                                            <option value="">Seleccione el cargo</option>
                                            <option value="d">Director</option>
                                            <option value="c">Cajero</option>
                                            <option value="r">Despachador de comida</option>
                                            <option value="e">Encargado de sala</option>
                                            <option value="a">Aseador</option>
                                        </select>
                                    </div>
                                </div>
							</div>
                            <p class="text-center">
								<button type="submit" name="accion" value="registrarU" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-addFuncion">
									<i class="zmdi zmdi-plus"></i>
								</button>
								<div class="mdl-tooltip" for="btn-addCompany">Registrar Usuario</div>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>