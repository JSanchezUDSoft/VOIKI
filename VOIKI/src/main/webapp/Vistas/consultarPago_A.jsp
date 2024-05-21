<%--
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Config.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="ModeloDAO.PropiedadDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Propiedad" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.IOException" %>
<%@ page import="ModeloDAO.ContratoDAO" %>
<%@ page import="Modelo.Contrato" %>
<%@ page import="ModeloDAO.PagoDAO" %>
<%@ page import="Modelo.Pago" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!--
* Copyright 2018 Carlos Eduardo Alfaro Orellana
https://www.youtube.com/c/CarlosAlfaro007
-->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Consultar Pagos Pendientes</title>
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
    <style>
        table {
            font-size: 10px; /* Reducir tamaño de la letra */
            border-collapse: collapse;
            border-spacing: 0;
            border: 2px solid #ddd; /* Borde de la tabla */
            width: 100%;
        }

        th, td {
            padding: 5px; /* Reducir espaciado interior de las celdas */
            text-align: center; /* Centrar contenido de las celdas */
            border-bottom: 1px solid #ddd; /* Borde inferior de las filas */
            max-width: 100px; /* Reducir ancho máximo de las celdas */
            white-space: nowrap; /* Evitar que el texto se ajuste automáticamente */
            overflow: hidden; /* Ocultar el contenido excedente */
            text-overflow: ellipsis; /* Mostrar puntos suspensivos si el contenido excede el ancho */
        }

        th {
            background-color: #f2f2f2; /* Color de fondo de las celdas del encabezado */
        }

        tr:hover {
            background-color: #f5f5f5; /* Cambiar color de fondo al pasar el cursor sobre la fila */
        }
    </style>
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
                            <a href="Controlador?accion=publicitarInmueble" class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-tv-list"></i>
                                </div>
                                <div class="navLateral-body-cr">
                                    Publicitar Inmueble
                                </div>
                            </a>
                        </li>
                        <li class="full-width">
                            <a href="Controlador?accion=consultarInmueble_A" class="full-width">
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
                        <li class="full-width">
                            <a href="Controlador?accion=consultarContrato_A" class="full-width">
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
                        <%/*<li class="full-width">
                            <a href="Controlador?accion=registrarPago" class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-tv-list"></i>
                                </div>
                                <div class="navLateral-body-cr">
                                    Registrar Pago
                                </div>
                            </a>
                        </li>*/%>
                        <li class="full-width">
                            <a href="Controlador?accion=consultarPago_A" class="full-width">
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
