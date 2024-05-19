package Modelo;

import java.io.StringWriter;

public class    Contrato {

    private int     idContrato;
    private String  fechaCreacion;
    private String  fechaFirma;
    private String  fechaInicio;
    private String  FechaFinalizacion;
    private String  cedulaArrendador;
    private String  cedulaArrendatario;
    private int     codigoInmueble;
    private int     canonPactado;//corregir diagrama de clases
    private int     periodoFacturacion;
    private String  terminosycondicionesContrato;
    private String  firmaArrendador;
    private String  firmaArrendatario;

    public Contrato() {
    }

    public Contrato(int idContrato, String fechaCreacion, String fechaFirma, String fechaInicio, String fechaFinalizacion, String cedulaArrendador, String cedulaArrendatario, int codigoInmueble, int canonPactado, int periodoFacturacion, String terminosycondicionesContrato, String firmaArrendador, String firmaArrendatario) {
        this.idContrato = idContrato;
        this.fechaCreacion = fechaCreacion;
        this.fechaFirma = fechaFirma;
        this.fechaInicio = fechaInicio;
        FechaFinalizacion = fechaFinalizacion;
        this.cedulaArrendador = cedulaArrendador;
        this.cedulaArrendatario = cedulaArrendatario;
        this.codigoInmueble = codigoInmueble;
        this.canonPactado = canonPactado;
        this.periodoFacturacion = periodoFacturacion;
        this.terminosycondicionesContrato = terminosycondicionesContrato;
        this.firmaArrendador = firmaArrendador;
        this.firmaArrendatario = firmaArrendatario;
    }

    public int getIdContrato() {
        return idContrato;
    }

    public void setIdContrato(int idContrato) {
        this.idContrato = idContrato;
    }

    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getFechaFirma() {
        return fechaFirma;
    }

    public void setFechaFirma(String fechaFirma) {
        this.fechaFirma = fechaFirma;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFinalizacion() {
        return FechaFinalizacion;
    }

    public void setFechaFinalizacion(String fechaFinalizacion) {
        FechaFinalizacion = fechaFinalizacion;
    }

    public String getCedulaArrendador() {
        return cedulaArrendador;
    }

    public void setCedulaArrendador(String cedulaArrendador) {
        this.cedulaArrendador = cedulaArrendador;
    }

    public String getCedulaArrendatario() {
        return cedulaArrendatario;
    }

    public void setCedulaArrendatario(String cedulaArrendatario) {
        this.cedulaArrendatario = cedulaArrendatario;
    }

    public int getCodigoInmueble() {
        return codigoInmueble;
    }

    public void setCodigoInmueble(int codigoInmueble) {
        this.codigoInmueble = codigoInmueble;
    }

    public int getCanonPactado() {
        return canonPactado;
    }

    public void setCanonPactado(int canonPactado) {
        this.canonPactado = canonPactado;
    }

    public int getPeriodoFacturacion() {
        return periodoFacturacion;
    }

    public void setPeriodoFacturacion(int periodoFacturacion) {
        this.periodoFacturacion = periodoFacturacion;
    }

    public String getTerminosycondicionesContrato() {
        return terminosycondicionesContrato;
    }

    public void setTerminosycondicionesContrato(String terminosycondicionesContrato) {
        this.terminosycondicionesContrato = terminosycondicionesContrato;
    }

    public String getFirmaArrendador() {
        return firmaArrendador;
    }

    public void setFirmaArrendador(String firmaArrendador) {
        this.firmaArrendador = firmaArrendador;
    }

    public String getFirmaArrendatario() {
        return firmaArrendatario;
    }

    public void setFirmaArrendatario(String firmaArrendatario) {
        this.firmaArrendatario = firmaArrendatario;
    }
}
