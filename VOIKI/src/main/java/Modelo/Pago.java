package Modelo;

public class Pago {

    private int     cuota;
    private int     valor;
    private String  fechaPago;
    private char    estadoPago;

    public Pago() {
    }

    public Pago(int cuota, int valor, String fechaPago, char estadoPago) {
        this.cuota = cuota;
        this.valor = valor;
        this.fechaPago = fechaPago;
        this.estadoPago = estadoPago;
    }

    public int getCuota() {
        return cuota;
    }

    public void setCuota(int cuota) {
        this.cuota = cuota;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public String getFechaPago() {
        return fechaPago;
    }

    public void setFechaPago(String fechaPago) {
        this.fechaPago = fechaPago;
    }

    public char getEstadoPago() {
        return estadoPago;
    }

    public void setEstadoPago(char estadoPago) {
        this.estadoPago = estadoPago;
    }
}
