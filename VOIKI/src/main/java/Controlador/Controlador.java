package Controlador;

import Modelo.*;
import ModeloDAO.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Controlador", value = "/Controlador")
public class Controlador extends HttpServlet {


    String registrarUsuario = "Vistas/registrar_usuario.jsp";
    String publicitarInmueble = "Vistas/publicitar_inmueble.jsp";
    String crearContrato = "Vistas/crear_contrato.jsp";

    String arrendatarioMain = "Vistas/arrendatario_main.jsp";
    String arrendadorMain = "Vistas/arrendador_main.jsp";

    String consultarInmueble = "Vistas/consultar_inmueble.jsp";
    String consultarContrato = "Vistas/consultar_contrato.jsp";
    String consultarPagos = "Vistas/consultar_pagos.jsp";

    String actualizarInmueble = "Vistas/actualizar_inmueble.jsp";

    String login = "index.jsp";


    LogIn logIn = new LogIn();
    LoginDAO loginDAO = new LoginDAO();

    Usuario usuario = new Usuario();
    UsuarioDAO usuarioDAO = new UsuarioDAO();

    Propiedad propiedad = new Propiedad();
    PropiedadDAO propiedadDAO = new PropiedadDAO();

    Contrato contrato = new Contrato();
    ContratoDAO contratoDAO = new ContratoDAO();

    Pago pago = new Pago();
    PagoDAO pagoDAO = new PagoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String acceso = "";
        String action = request.getParameter("accion");

        if(action.equalsIgnoreCase("Ingresar")){
            String  cedula = request.getParameter("userName");
            String  contrasena = request.getParameter("pass");

            logIn.setCedula(cedula);
            logIn.setContrasena(contrasena);

            byte r = loginDAO.iniciarSesion(logIn);

            if(r==1){
                acceso = arrendadorMain;
            }

            else if(r==2){
                acceso = arrendatarioMain;
            }

            else{
                acceso = login;
            }
        }
        else if (action.equalsIgnoreCase("Registrar")) {
            acceso = registrarUsuario;
        }
        else if (action.equalsIgnoreCase("RegistrarU")) {
            String cedula = (String )request.getParameter("identificacion");
            String telefono = (String) request.getParameter("telefono");
            String email = request.getParameter("email");
            String contrasena = (String) request.getParameter("pass");
            char rol = request.getParameter("rol").toCharArray()[0];
            String nombre = request.getParameter("nombreUsuario");

            Usuario newUser = new Usuario(cedula,nombre,telefono,email,rol,contrasena);
            System.out.println(newUser);
            usuarioDAO.registrarUsuario(newUser);

            acceso = login;

        } else if (action.equalsIgnoreCase("publicitarInmueble")) {
            acceso = publicitarInmueble;
        } else if (action.equalsIgnoreCase("registrarInmueble")) {

            String  cedulaCatastral =request.getParameter("ced_catas");
            String  matriculaInmobiliaria =  request.getParameter("matricula");
            String  direccion = request.getParameter("direccion");
            String  ciudad = request.getParameter("ciudad");
            String  barrio =request.getParameter("barrio");
            int     estrato = Integer.parseInt(request.getParameter("estrato"));
            int     area = Integer.parseInt(request.getParameter("area"));
            int     habitaciones = Integer.parseInt(request.getParameter("habitaciones"));
            int     banos = Integer.parseInt(request.getParameter("banos"));
            String  descripcion = request.getParameter("descripcion");
            int     canonArrrendamiento = Integer.parseInt(request.getParameter("canon"));
            char    disponibilidad = request.getParameter("disponibilidad").toCharArray()[0];

            propiedad.setCedulaCatastral(cedulaCatastral);
            propiedad.setMatriculaInmobiliaria(matriculaInmobiliaria);
            propiedad.setDireccion(direccion);
            propiedad.setCiudad(ciudad);
            propiedad.setBarrio(barrio);
            propiedad.setEstrato(estrato);
            propiedad.setArea(area);
            propiedad.setHabitaciones(habitaciones);
            propiedad.setBanos(banos);
            propiedad.setDescripcion(descripcion);
            propiedad.setCanonArrrendamiento(canonArrrendamiento);
            propiedad.setDisponibilidad(disponibilidad);

            propiedadDAO.publicitarInmueble(propiedad);

            acceso = publicitarInmueble;
        }
        else if (action.equalsIgnoreCase("Registrar")) {
            acceso = registrarUsuario;
        }
        else if (action.equalsIgnoreCase("RegistrarU")) {
            String cedula = (String )request.getParameter("identificacion");
            String telefono = (String) request.getParameter("telefono");
            String email = request.getParameter("email");
            String contrasena = (String) request.getParameter("pass");
            char rol = request.getParameter("rol").toCharArray()[0];
            String nombre = request.getParameter("nombreUsuario");

            Usuario newUser = new Usuario(cedula,nombre,telefono,email,rol,contrasena);
            System.out.println(newUser);
            usuarioDAO.registrarUsuario(newUser);

            acceso = login;

        } else if (action.equalsIgnoreCase("registrarContrato")) {
            acceso = crearContrato;
        } else if (action.equalsIgnoreCase("crearContrato")) {

            String  fechaInicio = request.getParameter("finicio");
            String  FechaFinalizacion = request.getParameter("ffin");
            String  cedulaArrendatario = request.getParameter("cArrendador");
            int     codigoInmueble = Integer.parseInt(request.getParameter("cInmueble"));
            int     canonPactado = Integer.parseInt(request.getParameter("canon"));
            int     periodoFacturacion = Integer.parseInt(request.getParameter("periodo"));
            String  terminosycondicionesContrato = request.getParameter("terms");

            contrato.setFechaInicio(fechaInicio);
            contrato.setFechaFinalizacion(FechaFinalizacion);
            contrato.setCedulaArrendatario(cedulaArrendatario);
            contrato.setCodigoInmueble(codigoInmueble);
            contrato.setCanonPactado(canonPactado);
            contrato.setPeriodoFacturacion(periodoFacturacion);
            contrato.setTerminosycondicionesContrato(terminosycondicionesContrato);

            contratoDAO.crearContrato(contrato);

            acceso = crearContrato;
        }

        RequestDispatcher vista=request.getRequestDispatcher(acceso);

        vista.forward(request, response);
    }
    //<a href="Controlador?accion=registrarUsuario">Listar Persona</a>

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
