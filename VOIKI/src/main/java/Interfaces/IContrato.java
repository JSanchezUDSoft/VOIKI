package Interfaces;

import Modelo.Contrato;

public interface IContrato {
    public boolean crearContrato(Contrato contrato);
    public Contrato consultarContrato(String cedula);
    public boolean firmarContrato(int idContrato);
    public boolean cancelarContrato(int idContrato);
}
