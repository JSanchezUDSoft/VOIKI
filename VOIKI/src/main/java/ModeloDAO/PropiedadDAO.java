package ModeloDAO;

import Config.Conexion;
import Interfaces.IPropiedad;
import Modelo.Propiedad;

import java.sql.*;

public class PropiedadDAO implements IPropiedad {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public boolean publicitarInmueble(Propiedad propiedad) {
        String sql="INSERT INTO propiedades (k_cedulacatastral, k_matriculainmobiliaria, d_propiedad, n_ciudad, n_barrio, o_estrato, v_area, v_habitaciones, v_banos, o_descripcion, v_canonarrendamiento, i_disponibilidad, k_cedula) VALUES ('"+propiedad.getCedulaCatastral()+"', '"+propiedad.getMatriculaInmobiliaria()+"', '"+propiedad.getDireccion()+"', '"+propiedad.getCiudad()+"', '"+propiedad.getBarrio()+"', '"+propiedad.getEstrato()+"', '"+propiedad.getArea()+"', '"+propiedad.getHabitaciones()+"', '"+propiedad.getBanos()+"', '"+propiedad.getDescripcion()+"', '"+propiedad.getCanonArrrendamiento()+"', 'D', '"+Conexion.getIdentificacion()+"')";
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

    public Propiedad consultarInmueblesDisponibles() {
        return null;
    }

    public boolean actualizarInformacionInmueble(Propiedad propiedad) {
        return false;
    }

    public boolean cambiarVisibilidadInmueble(int idInmueble) {
        return false;
    }
}
