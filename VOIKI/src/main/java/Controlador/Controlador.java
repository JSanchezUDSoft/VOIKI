package Controlador;

import Modelo.*;
import ModeloDAO.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Controlador", value = "/Controlador")
public class Controlador extends HttpServlet {

    String listar="Vistas/listar.jsp";
    String add="Vistas/add.jsp";
    String edit="Vistas/edit.jsp";

    String registrarUsuario = "Vistas/registrar_usuario.jsp";
    String publicitarInmueble = "Vistas/publicitar_inmueble.jsp";
    String crearContrato = "Vistas/crear_contrato.jsp";

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

        if(action.equalsIgnoreCase("listar")){
            acceso = listar;
        }
        else if (action.equalsIgnoreCase("add")){
            acceso = add;
        }
        else if (action.equalsIgnoreCase("Agregar")){
            /*int id = Integer.parseInt(request.getParameter("txtId"));
            String dni = request.getParameter("txtDni");
            String nombre = request.getParameter("txtNombre");

            p.setId(id);
            p.setDni(dni);
            p.setNom(nombre);
            dao.add(p);

            acceso = listar;*/
        }
       /* else if(action.equalsIgnoreCase("registrarUsuario")){
            acceso = registrarUsuario;
        }
        else if(action.equalsIgnoreCase("registrarU")){
            String  codigoE = "";
            String  identificacion = request.getParameter("identificacion");
            String  nombre = request.getParameter("nombreEmpleado");
            String  celular = request.getParameter("telefono");
            String  fechaContrato = request.getParameter("fechaContrato");
            String  salario = request.getParameter("salario");
            String  multiplex = request.getParameter("idMultiplex");
            String  rol = request.getParameter("rol");
            String  cargo = request.getParameter("cargo");
            String  randomPassword = "";

            //Generar codigo del empleado
            codigoE = nombre.charAt(0) + identificacion;

            //Generar contraseña aleatoria
                //Create a variable to store the random password

                //Randomly generate a character for the password length number of times
                for(int j = 0; j < 8; j++) {
                    //Add a random lowercase or UPPERCASE character to our randomPassword String
                    randomPassword += usuario.randomCharacter();
                }
                //Add the random password to your array


            usuario.setCodigoEmpleado(codigoE);
            usuario.setIdentificacion(identificacion);
            usuario.setNombre(nombre);
            usuario.setCelular(celular);
            usuario.setFechaContrato(fechaContrato);
            usuario.setSalario(salario);
            usuario.setMultiplex(multiplex);
            usuario.setRol(rol.charAt(0));
            usuario.setCargo(cargo.charAt(0));
            usuario.setContrasena(randomPassword);

            daoP.registrarUsuario(u);

            acceso = registrarUsuario;
        }
        else if(action.equalsIgnoreCase("registrarMultiplex")){
            acceso = registrarMultiplex;
        }
        else if(action.equalsIgnoreCase("registrarM")){
            String  nombre = request.getParameter("nombreMultiplex");
            String  direccion = request.getParameter("direccion");

            m.setNombreM(nombre);
            m.setDireccion(direccion);

            daoM.registrarMultiplex(m);

            acceso = registrarMultiplex;
        }*/
        else if(action.equalsIgnoreCase("Ingresar")){
            String  cedula = request.getParameter("userName");
            String  contrasena = request.getParameter("pass");

            logIn.setCedula(cedula);
            logIn.setContrasena(contrasena);

            byte r = loginDAO.iniciarSesion(logIn);

            if(r==1){
                acceso = crearContrato;
            }

            else if(r==2){
                acceso = consultarInmueble;
            }

            else{
                acceso = login;
            }
        }

        RequestDispatcher vista=request.getRequestDispatcher(acceso);

        vista.forward(request, response);
    }
    //<a href="Controlador?accion=registrarUsuario">Listar Persona</a>

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
