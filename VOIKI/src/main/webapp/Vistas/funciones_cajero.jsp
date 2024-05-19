<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Funciones disponibles</title>
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
						<small>Cajero</small>
					</span>
            </figcaption>
        </figure>
        <nav class="full-width">
            <ul class="full-width list-unstyle menu-principal">
                <li class="full-width divider-menu-h"></li>
                <li class="full-width">
                    <a href="products.html" class="full-width">
                        <div class="navLateral-body-cl">
                            <i class="zmdi zmdi-ticket-star"></i>
                        </div>
                        <div class="navLateral-body-cr">
                            INICIAR VENTA
                        </div>
                    </a>
                </li>
                <li class="full-width divider-menu-h"></li>
                <li class="full-width">
                    <a href="products.html" class="full-width">
                        <div class="navLateral-body-cl">
                            <i class="zmdi zmdi-tv-list"></i>
                        </div>
                        <div class="navLateral-body-cr">
                            CONSULTAR FUNCIONES
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
                Funciones activas
            </p>
        </div>
    </section>
    <div class="full-width divider-menu-h"></div>
    <div class="mdl-grid">
        <div class="mdl-cell mdl-cell--4-col-phone mdl-cell--8-col-tablet mdl-cell--12-col-desktop">
            <div class="table-responsive">
                <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp full-width table-responsive">
                    <thead>
                    <tr>
                        <th class="mdl-data-table__cell--non-numeric">Función</th>
                        <th class="mdl-data-table__cell--non-numeric">Fecha</th>
                        <th class="mdl-data-table__cell--non-numeric">Horas</th>
                        <th class="mdl-data-table__cell--non-numeric">Película</th>
                        <th class="mdl-data-table__cell--non-numeric">Sala</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="mdl-data-table__cell--non-numeric">Función 1</td>
                        <td class="mdl-data-table__cell--non-numeric">15/05/2022</td>
                        <td class="mdl-data-table__cell--non-numeric">13:41 - 15:41</td>
                        <td class="mdl-data-table__cell--non-numeric">Spiderman no way home</td>
                        <td class="mdl-data-table__cell--non-numeric">Sala 1</td>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>
</section>
</body>
</html>