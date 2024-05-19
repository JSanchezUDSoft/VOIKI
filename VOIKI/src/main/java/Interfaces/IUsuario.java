package Interfaces;

import Modelo.Usuario;

public interface IUsuario {
    public boolean registrarUsuario(Usuario usuario);
    public Usuario consultarArrendadorArrendatario(String cedula);//Agregar diaclases
    public boolean eliminarUsuario(String cedula);

}
