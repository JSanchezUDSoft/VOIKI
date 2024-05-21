<%--
  Created by IntelliJ IDEA.
  User: Hemerson Ballen
  Date: 19/05/2024
  Time: 3:00 p. m.
  To change this template use File | Settings | File Templates.
--%><%@ page import="java.io.PrintWriter" %>

<%@ page import="Config.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="ModeloDAO.PropiedadDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Propiedad" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.IOException" %>
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
                            <a href="Controlador?accion=consultarContrato" class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-local-library"></i>
                                </div>
                                <div class="navLateral-body-cr">
                                    Consultar Contrato
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
                            <a href="Controlador?accion=consultarPlanPago" class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-search"></i>
                                </div>
                                <div class="navLateral-body-cr">
                                    Consultar Plan de Pagos
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
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--12-col">
            <div class="full-width panel mdl-shadow--2dp">
                <div class="full-width panel-tittle bg-primary text-center tittles">
                    Inmuebles
                </div>
                <div class="full-width panel-content">
                    <table>
                        <thead>
                        <tr>
                            <th scope="col">Canon</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Ciudad</th>
                            <th scope="col">Dirección</th>
                            <th scope="col">Barrio</th>
                            <th scope="col">Estrato</th>
                            <th scope="col">Arear</th>
                            <th scope="col">Número de habitaciones</th>
                            <th scope="col">Número de baños</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            PropiedadDAO dao = new PropiedadDAO();
                            List<Propiedad> propiedadesList= new ArrayList<>();
                            propiedadesList = dao.consultarInmueblesDisponibles();
                            try {
                                for(Propiedad prop:propiedadesList){
                                    out.println("<tr>");
                                    out.println("<td>" + prop.getCanonArrrendamiento() + "</td>");
                                    out.println("<td>" + prop.getDescripcion() + "</td>");
                                    out.println("<td>" + prop.getCiudad() + "</td>");
                                    out.println("<td>" + prop.getDireccion() + "</td>");
                                    out.println("<td>" + prop.getBarrio() + "</td>");
                                    out.println("<td>" + prop.getEstrato() + "</td>");
                                    out.println("<td>" + prop.getArea() + "</td>");
                                    out.println("<td>" + prop.getHabitaciones() + "</td>");
                                    out.println("<td>" + prop.getBanos() + "</td>");
                                    out.println("</tr>");
                                }
                            }catch (Exception e){

                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="full-width divider-menu-h"></div>

</section>
</body>
</html>
