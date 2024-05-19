<%--
  Created by IntelliJ IDEA.
  User: Hemerson Ballen
  Date: 19/05/2024
  Time: 3:00 p. m.
  To change this template use File | Settings | File Templates.
--%>
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
            <i class="zmdi zmdi-close btn-menu"></i> VOIKI
        </div>
        <nav class="full-width">
            <ul class="full-width list-unstyle menu-principal">
                <li class="full-width">
                    <a href="#!" class="full-width btn-subMenu">
                        <div class="navLateral-body-cl">
                            <i class="zmdi zmdi-local-hotel"></i>
                        </div>
                        <div class="navLateral-body-cr">
                            Inmuebles
                        </div>
                        <span class="zmdi zmdi-chevron-left"></span>
                    </a>
                    <ul class="full-width menu-principal sub-menu-options">
                        <li class="full-width">
                            <a href="Controlador?accion=registrarInmueble" class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-tv-list"></i>
                                </div>
                                <div class="navLateral-body-cr">
                                    Publicitar Inmueble
                                </div>
                            </a>
                        </li>
                        <li class="full-width">
                            <a href="Controlador?accion=consultarInmueble" class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-pages"></i>
                                </div>
                                <div class="navLateral-body-cr">
                                    Consultar Inmuebles
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="full-width divider-menu-h"></li>
                <li class="full-width">
                    <a href="#!" class="full-width btn-subMenu">
                        <div class="navLateral-body-cl">
                            <i class="zmdi zmdi-accounts"></i>
                        </div>
                        <div class="navLateral-body-cr">
                            Contratos
                        </div>
                        <span class="zmdi zmdi-chevron-left"></span>
                    </a>
                    <ul class="full-width menu-principal sub-menu-options">
                        <li class="full-width">
                            <a href="Controlador?accion=registrarContrato" class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-local-library"></i>
                                </div>
                                <div class="navLateral-body-cr">
                                    Crear Contrato
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="full-width divider-menu-h"></li>
                <li class="full-width">
                    <a href="#!" class="full-width btn-subMenu">
                        <div class="navLateral-body-cl">
                            <i class="zmdi zmdi-money"></i>
                        </div>
                        <div class="navLateral-body-cr">
                            Pagos
                        </div>
                        <span class="zmdi zmdi-chevron-left"></span>
                    </a>
                    <ul class="full-width menu-principal sub-menu-options">
                        <li class="full-width">
                            <a href="Controlador?accion=registrarPago" class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-tv-list"></i>
                                </div>
                                <div class="navLateral-body-cr">
                                    Registrar Pago
                                </div>
                            </a>
                        </li>
                        <li class="full-width">
                            <a href="Controlador?accion=consultarPago" class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-search"></i>
                                </div>
                                <div class="navLateral-body-cr">
                                    Consultar Pago
                                </div>
                            </a>
                        </li>
                    </ul>
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
                    Nuevo Inmueble
                </div>
                <div class="full-width panel-content">
                    <form action="Controlador">
                        <div class="mdl-grid">
                            <div class="mdl-cell mdl-cell--12-col">
                                <legend class="text-condensedLight"><i class="zmdi zmdi-border-color"></i>DATOS DEL INMUEBLE</legend><br>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  required type="number" pattern="-?[0-9]*([0-9])?" id="ced_catas" name="ced_catas">
                                    <label class="mdl-textfield__label" for="ced_catas">Cedula Catastral</label>
                                    <span class="mdl-textfield__error">Cedula Invalida</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  required type="number" pattern="-?[0-9]*([0-9])?" id="matricula" name="matricula">
                                    <label class="mdl-textfield__label" for="matricula">Matricula Inmobilaria</label>
                                    <span class="mdl-textfield__error">Matricula Invalida</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  required type="text" id="direccion" name="direccion">
                                    <label class="mdl-textfield__label" for="direccion">Dirección</label>
                                    <span class="mdl-textfield__error">Dirección invalida</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  required type="text" id="ciudad" name="ciudad">
                                    <label class="mdl-textfield__label" for="ciudad">Ciudad</label>
                                    <span class="mdl-textfield__error">Ciudad invalida</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  required type="text" id="barrio" name="barrio">
                                    <label class="mdl-textfield__label" for="barrio">Barrio</label>
                                    <span class="mdl-textfield__error">Barrio invalido</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  required type="number" id="estrato" name="estrato">
                                    <label class="mdl-textfield__label" for="estrato">Estrato</label>
                                    <span class="mdl-textfield__error">Estrato Invalido</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  required type="text" id="area" name="area">
                                    <label class="mdl-textfield__label" for="area">Area</label>
                                    <span class="mdl-textfield__error">Area Invalida</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  required type="number" id="habitaciones" name="habitaciones">
                                    <label class="mdl-textfield__label" for="habitaciones">Habitaciones</label>
                                    <span class="mdl-textfield__error">Número de Habitaciones Invalido</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  required type="number" id="banos" name="banos">
                                    <label class="mdl-textfield__label" for="banos">Baños</label>
                                    <span class="mdl-textfield__error">Número de Baños Invalido</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input" required type="text" id="descripcion" name="descripcion">
                                    <label class="mdl-textfield__label" for="descripcion">Descripcion del Inmueble</label>
                                    <span class="mdl-textfield__error">Descripcion vacia</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  required type="number" id="canon" name="canon">
                                    <label class="mdl-textfield__label" for="canon">Canon de Arrendamiento</label>
                                    <span class="mdl-textfield__error">Canon invalido</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <select name="disponibilidad" class="mdl-textfield__input">
                                        <option value="">Seleccione la disponibilidad</option>
                                        <option value="D">Disponible</option>
                                        <option value="A">Arrendado</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <p class="text-center">
                            <button type="submit" name="accion" value="registrarInmueble" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-addFuncion">
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
