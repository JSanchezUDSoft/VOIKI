package Modelo;

public class LogIn {

    private String  cedula;
    private String  contrasena;

    public LogIn() {
    }

    public LogIn(String cedula, String contrasena) {
        this.cedula = cedula;
        this.contrasena = contrasena;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
}
