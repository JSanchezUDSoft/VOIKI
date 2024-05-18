package Interfaces;

import Modelo.Propiedad;

public interface IPropiedad {
    public boolean publicitarInmueble(Propiedad propiedad);
    public Propiedad consultarInmueblesDisponibles();
    public boolean actualizarInformacionInmueble(Propiedad propiedad);
    public boolean cambiarVisibilidadInmueble(int idInmueble);
}
