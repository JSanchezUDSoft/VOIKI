<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Boletas vendidas</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/sweetalert2.css">
    <link rel="stylesheet" href="css/material.min.css">
    <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>')</script>
    <script src="js/material.min.js" ></script>
    <script src="js/sweetalert2.min.js" ></script>
    <script src="js/jquery.mCustomScrollbar.concat.min.js" ></script>
    <script src="js/main.js" ></script>
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
                <img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">
            </div>
            <figcaption>
					<span>
						Full Name Admin<br>
						<small>Director</small>
					</span>
            </figcaption>
        </figure>
        <nav class="full-width">
            <ul class="full-width list-unstyle menu-principal">
                <li class="full-width">
                    <!--<a href="home.html" class="full-width">
                        <div class="navLateral-body-cl">
                            <i class="zmdi zmdi-view-dashboard"></i>
                        </div>
                        <div class="navLateral-body-cr">
                            REGISTRAR FUNCION
                        </div>
                    </a>-->
                <li class="full-width divider-menu-h"></li>
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
                            <a href="company.html" class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-tv-play"></i>
                                </div>
                                <div class="navLateral-body-cr">
                                    REGISTRAR FUNCION
                                </div>
                            </a>
                        </li>
                        <li class="full-width">
                            <a href="providers.html" class="full-width">
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
                            <a href="admin.html" class="full-width">
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
                            <a href="admin.html" class="full-width">
                                <div class="navLateral-body-cl">
                                    <i class="zmdi zmdi-cast"></i>
                                </div>
                                <div class="navLateral-body-cr">
                                    REGISTRAR SALA
                                </div>
                            </a>
                        </li>
                        <li class="full-width">
                            <a href="client.html" class="full-width">
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
                    <a href="products.html" class="full-width">
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
                            <img src="assets/img/avatar-male.png" alt="Avatar" class="img-responsive">
                        </figure>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <section class="full-width header-well">
        <div class="full-width header-well-icon">
            <i class="zmdi zmdi-store"></i>
        </div>
        <div class="full-width header-well-text">
            <p class="text-condensedLight">
                Reporte de boletas vendidas
            </p>
        </div>
    </section>
    <div class="table-responsive">
        <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
            <thead>
            <tr>
                <th class="mdl-data-table__cell--non-numeric">Id. Silla</th>
                <th class="mdl-data-table__cell--non-numeric">Precio</th>
                <th class="mdl-data-table__cell--non-numeric">Id. Cliente</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="mdl-data-table__cell--non-numeric">A2</td>
                <td class="mdl-data-table__cell--non-numeric">5000</td>
                <td class="mdl-data-table__cell--non-numeric">1000215778</td>
            </tr>
            </tbody>
        </table>
    </div>
</section>
</body>
</html>
