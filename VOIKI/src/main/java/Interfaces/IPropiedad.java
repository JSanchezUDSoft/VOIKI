package Interfaces;

import Modelo.Propiedad;
import java.util.List;

public interface IPropiedad {
    public boolean publicitarInmueble(Propiedad propiedad);
    public List<Propiedad> consultarInmueblesDisponibles();
    public boolean actualizarInformacionInmueble(Propiedad propiedad);
    public boolean cambiarVisibilidadInmueble(int idInmueble);
}
