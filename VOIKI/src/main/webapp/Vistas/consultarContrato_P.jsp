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
<%@ page import="ModeloDAO.PropiedadDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Propiedad" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.IOException" %>
<%@ page import="ModeloDAO.ContratoDAO" %>
<%@ page import="Modelo.Contrato" %>
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
                                <a href="Controlador?accion=consultarInmueble_P" class="full-width">
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
                            <%--
                                <li class="full-width">
                                    <a href="Controlador?accion=registrarContrato_P" class="full-width">
                                        <div class="navLateral-body-cl">
                                            <i class="zmdi zmdi-local-library"></i>
                                        </div>
                                        <div class="navLateral-body-cr">
                                            Crear Contrato
                                        </div>
                                    </a>
                                </li>
                            --%>
                            <li class="full-width">
                                <a href="Controlador?accion=consultarContrato_P" class="full-width">
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
                                <a href="Controlador?accion=consultarPago_P" class="full-width">
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
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--12-col">
            <div class="full-width panel mdl-shadow--2dp">
                <div class="full-width panel-tittle bg-primary text-center tittles">
                    Contrato Pendiente
                </div>
                <div class="full-width panel-content">
                    <%
                        ContratoDAO dao = new ContratoDAO();
                        Contrato contrato = dao.consultarContrato((String)request.getAttribute("ced"));
                    %>
                    <form action="Controlador">
                        <div class="mdl-grid">
                            <div class="mdl-cell mdl-cell--12-col">
                                <legend class="text-condensedLight"><i class="zmdi zmdi-border-color"></i>DATOS DEL CONTRATO</legend><br>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  type="date"  id="finicio" name="finicio" disabled value=<%out.println('"'+contrato.getFechaInicio()+'"');%>>
                                    <label class="mdl-textfield__label" for="finicio">Fecha de Inicio</label>
                                    <span class="mdl-textfield__error">Cedula Invalida</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  type="date" id="ffin" name="ffin" disabled value=<%out.println('"'+contrato.getFechaFinalizacion()+'"');%>>
                                    <label class="mdl-textfield__label" for="ffin">Fecha de Finalizacion</label>
                                    <span class="mdl-textfield__error">Matricula Invalida</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  type="number" id="cArrendador" name="cArrendador" disabled value=<%out.println('"'+contrato.getCedulaArrendador()+'"');%>>
                                    <label class="mdl-textfield__label" for="cArrendador">Cédula Arrendador</label>
                                    <span class="mdl-textfield__error">Dirección invalida</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <%
                                        Conexion cn = new Conexion();
                                        Connection con;
                                        PreparedStatement ps;
                                        ResultSet rs;
                                        String direccion="";
                                        String ciudad="";
                                        String sql = "select k_propiedad, d_propiedad, n_ciudad from propiedades where k_propiedad =?";
                                        try {
                                            con = cn.getConnection();
                                            ps = con.prepareStatement(sql);
                                            String codigo = contrato.getCodigoInmueble()+"";
                                            ps.setString(1,codigo);
                                            rs = ps.executeQuery();

                                            while (rs.next()) {
                                                direccion = rs.getString(2);
                                                ciudad = rs.getString(3);
                                            }
                                        }catch (Exception e){
                                            System.out.println(e);
                                        }
                                    %>
                                    <input class="mdl-textfield__input"  type="text" id="inmueble" name="inmueble" disabled value=<%out.println('"'+direccion+'"');%>>
                                    <label class="mdl-textfield__label" for="inmueble">Inmueble A arrendar</label>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  type="text" id="ciudad" name="ciudad" disabled value=<%out.println('"'+ciudad+'"');%>>
                                    <label class="mdl-textfield__label" for="inmueble">Ciudad del inmueble</label>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input"  type="number" id="canon" name="canon" disabled value=<%String canon = contrato.getCanonPactado()+""; out.println('"'+canon+'"');%>>
                                    <label class="mdl-textfield__label" for="canon">Canon de arrendamiento pactado</label>
                                    <span class="mdl-textfield__error">Canon invalido</span>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-cell--6-col mdl-cell--8-col-tablet">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <textarea class="mdl-textfield__input" id="terms" name="terms" disabled><%out.println(contrato.getTerminosycondicionesContrato());%></textarea>
                                    <label class="mdl-textfield__label" for="terms">Terminos y condiciones contrato</label>
                                    <span class="mdl-textfield__error">Barrio invalido</span>
                                </div>
                            </div>
                            <input  type="number" id="idContrato" name="idContrato" style="visibility: hidden" value=<%String id = contrato.getIdContrato()+""; out.println('"'+id+'"');%>>
                        </div>
                        <p class="text-center">
                            <button type="submit" name="accion" value="firmarContrato_P" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored bg-primary" id="btn-addFuncion">
                                <i class="zmdi zmdi-check"></i>
                            </button>
                        <div class="mdl-tooltip" for="btn-addCompany">Firmar Contrato</div>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="full-width divider-menu-h"></div>

</section>
</body>
</html>