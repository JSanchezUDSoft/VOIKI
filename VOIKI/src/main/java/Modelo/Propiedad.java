package Modelo;

public class Propiedad {

    private int     idPropiedad;
    private String  cedulaCatastral;
    private String  matriculaInmobiliaria;
    private String  direccion;
    private String  ciudad;
    private String  barrio;
    private int     estrato;
    private int     area;
    private int     habitaciones;
    private int     banos;
    private String  descripcion;
    private int     canonArrrendamiento;
    private char    disponibilidad;

    public Propiedad() {
    }

    public Propiedad(int idPropiedad, String cedulaCatastral, String matriculaInmobiliaria, String direccion, String ciudad, String barrio, int estrato, int area, int habitaciones, int banos, String descripcion, int canonArrrendamiento, char disponibilidad) {
        this.idPropiedad = idPropiedad;
        this.cedulaCatastral = cedulaCatastral;
        this.matriculaInmobiliaria = matriculaInmobiliaria;
        this.direccion = direccion;
        this.ciudad = ciudad;
        this.barrio = barrio;
        this.estrato = estrato;
        this.area = area;
        this.habitaciones = habitaciones;
        this.banos = banos;
        this.descripcion = descripcion;
        this.canonArrrendamiento = canonArrrendamiento;
        this.disponibilidad = disponibilidad;
    }

    public int getIdPropiedad() {
        return idPropiedad;
    }

    public void setIdPropiedad(int idPropiedad) {
        this.idPropiedad = idPropiedad;
    }

    public String getCedulaCatastral() {
        return cedulaCatastral;
    }

    public void setCedulaCatastral(String cedulaCatastral) {
        this.cedulaCatastral = cedulaCatastral;
    }

    public String getMatriculaInmobiliaria() {
        return matriculaInmobiliaria;
    }

    public void setMatriculaInmobiliaria(String matriculaInmobiliaria) {
        this.matriculaInmobiliaria = matriculaInmobiliaria;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getBarrio() {
        return barrio;
    }

    public void setBarrio(String barrio) {
        this.barrio = barrio;
    }

    public int getEstrato() {
        return estrato;
    }

    public void setEstrato(int estrato) {
        this.estrato = estrato;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getHabitaciones() {
        return habitaciones;
    }

    public void setHabitaciones(int habitaciones) {
        this.habitaciones = habitaciones;
    }

    public int getBanos() {
        return banos;
    }

    public void setBanos(int banos) {
        this.banos = banos;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCanonArrrendamiento() {
        return canonArrrendamiento;
    }

    public void setCanonArrrendamiento(int canonArrrendamiento) {
        this.canonArrrendamiento = canonArrrendamiento;
    }

    public char getDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(char disponibilidad) {
        this.disponibilidad = disponibilidad;
    }
}