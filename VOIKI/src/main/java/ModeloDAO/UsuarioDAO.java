package ModeloDAO;

import Config.Conexion;
import Interfaces.IUsuario;
import Modelo.Usuario;

import java.sql.*;

public class UsuarioDAO implements IUsuario {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public boolean registrarUsuario(Usuario usuario) {
        String sql="INSERT INTO usuarios (k_cedula, n_nombre, t_celular, o_correo, i_rol, o_contrasena) VALUES ('"+usuario.getCedula()+"', '"+usuario.getNombre()+"', '"+usuario.getCelular()+"', '"+usuario.getCorreo()+"', '"+usuario.getRol()+"', '"+usuario.getContrasena()+"')";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        }catch (Exception e){
            System.out.println(e.toString());
            return false;
        }
    }

    public Usuario consultarArrendadorArrendatario(String cedula) {

    }
}
