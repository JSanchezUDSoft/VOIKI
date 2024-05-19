package ModeloDAO;

import Config.Conexion;
import Interfaces.IPropiedad;
import Modelo.Propiedad;

import java.sql.*;
import java.util.*;

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

    public List<Propiedad> consultarInmueblesDisponibles() {
        List<Propiedad> lista = new ArrayList<>();
        String sql = "SELECT * FROM propiedades WHERE i_disponibilidad = 'D'"; // 'D' para disponibles, ajustar según tu lógica
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Propiedad propiedad = new Propiedad();
                propiedad.setIdPropiedad(rs.getInt("k_propiedad"));
                propiedad.setCedulaCatastral(rs.getString("k_cedulacatastral"));
                propiedad.setMatriculaInmobiliaria(rs.getString("k_matriculainmobiliaria"));
                propiedad.setDireccion(rs.getString("d_propiedad"));
                propiedad.setCiudad(rs.getString("n_ciudad"));
                propiedad.setBarrio(rs.getString("n_barrio"));
                propiedad.setEstrato(rs.getInt("o_estrato"));
                propiedad.setArea(rs.getInt("v_area"));
                propiedad.setHabitaciones(rs.getInt("v_habitaciones"));
                propiedad.setBanos(rs.getInt("v_banos"));
                propiedad.setDescripcion(rs.getString("o_descripcion"));
                propiedad.setCanonArrrendamiento(rs.getInt("v_canonarrendamiento"));
                propiedad.setDisponibilidad(rs.getString("i_disponibilidad").charAt(0));
                lista.add(propiedad);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return lista;
    }

    public boolean actualizarInformacionInmueble(Propiedad propiedad) {
        String sql = "UPDATE propiedades SET D_PROPIEDAD = '"+propiedad.getDireccion()+"', N_CIUDAD = '"+propiedad.getCiudad()+"', N_BARRIO = '"+propiedad.getBarrio()+"', O_ESTRATO = '"+propiedad.getBarrio()+"', V_AREA = '"+propiedad.getArea()+"', V_HABITACIONES = '"+propiedad.getHabitaciones()+"', O_DESCRIPCION = '"+propiedad.getDescripcion()+"', V_CANONARRENDAMIENTO = '"+propiedad.getCanonArrrendamiento()+"' WHERE (K_PROPIEDAD = '"+propiedad.getIdPropiedad()+"')";

        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

            return true;
        }catch (Exception e) {
            return false;
        }
    }

    public boolean cambiarVisibilidadInmueble(int idInmueble) {
        String sql = "UPDATE propiedades SET I_DISPONIBILIDAD = 'A' WHERE (K_PROPIEDAD = '" + idInmueble + "')";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
