package Interfaces;

import Modelo.Pago;
import java.util.List;

public interface IPago {
    //Corregir diaclases URGENTE!!!
    public boolean registrarPlandePagos(int idPago, String fechaInicio, String fechaFin, int valor, int periodoFacturacion);
    public List<Pago> consultarPagos(char tipoConsulta, String valorConsulta);//Consultar por parte del arrendador para ver pendienres de pago, por cedula o por propiedad o en general las propiedades pendienres de pago
    public boolean cambiarEstadoPago(int idPago, String estado);
}
