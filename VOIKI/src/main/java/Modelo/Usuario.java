package Modelo;

public class Usuario {

    private String  cedula;
    private String  nombre;
    private String  celular;
    private String  correo;
    private char    rol;
    private String  contrasena;

    public Usuario() {
    }

    public Usuario(String cedula, String nombre, String celular, String correo, char rol, String contrasena) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.celular = celular;
        this.correo = correo;
        this.rol = rol;
        this.contrasena = contrasena;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public char getRol() {
        return rol;
    }

    public void setRol(char rol) {
        this.rol = rol;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
}
