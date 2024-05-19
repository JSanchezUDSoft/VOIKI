<%--
  Created by IntelliJ IDEA.
  User: Hemerson Ballen
  Date: 19/05/2024
  Time: 1:09 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Config.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!--

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

<!-- pageContent -->
<section class="full-width pageContent pageContent-change">
    <!-- navBar -->
    <div class="full-width divider-menu-h"></div>
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--12-col">
            <div class="full-width panel mdl-shadow--2dp">
                <div class="full-width panel-tittle bg-primary text-center tittles">
                    Nuevo Usuario
                </div>
                <div class="full-width panel-content">
                    <form action="Controlador">
                        <div class="mdl-grid">
                            <div class="mdl-cell mdl-cell--12-col">
                                <legend class="text-condensedLight"><i class="zmdi zmdi-border-color"></i> &nbsp; DATOS DEL USUARIO</legend><br>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  required type="number" pattern="-?[0-9]*([0-9])?" id="identificacion" name="identificacion">
                                    <label class="mdl-textfield__label" for="identificacion">Número de identificación</label>
                                    <span class="mdl-textfield__error">Id invalido</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input" type="text" required pattern="-?[A-Za-z0-9áéíóúÁÉÍÓÚ ]*(\.[0-9]+)?" id="nombreUsuario" name="nombreUsuario">
                                    <label class="mdl-textfield__label" for="nombreUsuario">Nombre</label>
                                    <span class="mdl-textfield__error">Nombre no valido</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input" type="tel" pattern="-?[0-9+()- ]*(\.[0-9]+)?" required id="telefono" name="telefono">
                                    <label class="mdl-textfield__label" for="telefono">Teléfono</label>
                                    <span class="mdl-textfield__error">Telefono no valido</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input" type="email" id="email" name="email" required/>
                                    <label class="mdl-textfield__label" for="email">Email</label>
                                    <span class="mdl-textfield__error">Email no valido</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input" type="password" id="pass" name="pass">
                                    <label class="mdl-textfield__label" for="pass">Contrase&ntilde;a</label>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <select name="rol" class="mdl-textfield__input">
                                        <option value="">Seleccione el rol</option>
                                        <option value="A">Arrendador</option>
                                        <option value="P">Arrendatario</option>
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
