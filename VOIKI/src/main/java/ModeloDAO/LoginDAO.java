package ModeloDAO;

import Config.Conexion;
import Interfaces.ILogin;
import Modelo.LogIn;

import java.sql.*;

public class LoginDAO implements ILogin {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public byte iniciarSesion(LogIn logIn) {

        String sql = "select i_rol from usuarios where k_cedula = '"+logIn.getCedula()+"' and o_contrasena='"+logIn.getContrasena()+"'";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            String rol = "";
            while(rs.next()) {
                rol = rs.getString("i_rol");
            }

            if(rol.equals("A")){
                Conexion.setIdentificacion(logIn.getCedula());
                return 1;
            }
            else if(rol.equals("P")){
                Conexion.setIdentificacion(logIn.getCedula());
                return 2;
            }
            else{
                return 3;
            }
        }catch(Exception e){
            return 4;
        }
    }
}
