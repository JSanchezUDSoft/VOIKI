package Config;
import java.sql.*;

public class Conexion {

    public static String identificacion;

    public static String getIdentificacion() {
        return identificacion;
    }

    public static void setIdentificacion(String identificacion) {
        Conexion.identificacion = identificacion;
    }

    Connection con;
    public Conexion(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/VOIKI?useTimezone=true&serverTimezone=UTC","root","ARTORIAS27");
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
    }
    public Connection getConnection(){
        return con;
    }
}
