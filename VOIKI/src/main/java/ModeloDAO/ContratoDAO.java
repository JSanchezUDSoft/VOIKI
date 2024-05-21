package ModeloDAO;

import Config.Conexion;
import Interfaces.IContrato;
import Modelo.Contrato;

import java.sql.*;
import java.util.*;

public class ContratoDAO implements IContrato {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public boolean crearContrato(Contrato contrato) {
        //Eliminar atributo fecha creacion, cedula arrendador, firma arrendador
        String sql="INSERT INTO contratos (f_creacion, f_inicio, f_finalizacion, k_arrendador, k_arrendatario, k_propiedad, v_canonpactado, v_periodofacturacion, o_terminosycondiciones, i_firmaarrendador, i_firmaarrendatario, i_estadocontrato) VALUES (now(), '"+contrato.getFechaInicio()+"', '"+contrato.getFechaFinalizacion()+"', '"+Conexion.getIdentificacion()+"', '"+contrato.getCedulaArrendatario()+"', '"+contrato.getCodigoInmueble()+"', '"+contrato.getCanonPactado()+"', '"+contrato.getPeriodoFacturacion()+"', '"+contrato.getTerminosycondicionesContrato()+"', 'F', 'P', 'A')";
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

    public Contrato consultarContrato(String cedula) {
        Contrato contrato = null;
        String sql = "SELECT * FROM contratos WHERE k_arrendatario = ? and i_firmaarrendatario = 'P'";
        try {
            System.out.println(cedula);
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cedula);
            rs = ps.executeQuery();
            if (rs.next()) {
                contrato = new Contrato();
                contrato.setIdContrato(rs.getInt("k_contrato"));
                contrato.setFechaCreacion(rs.getString("f_creacion"));
                contrato.setFechaFirma(rs.getString("f_firma"));
                contrato.setFechaInicio(rs.getString("f_inicio"));
                contrato.setFechaFinalizacion(rs.getString("f_finalizacion"));
                contrato.setCedulaArrendador(rs.getString("k_arrendador"));
                contrato.setCedulaArrendatario(rs.getString("k_arrendatario"));
                contrato.setCodigoInmueble(rs.getInt("k_propiedad"));
                contrato.setCanonPactado(rs.getInt("v_canonpactado"));
                contrato.setPeriodoFacturacion(rs.getInt("v_periodofacturacion"));
                contrato.setTerminosycondicionesContrato(rs.getString("o_terminosycondiciones"));
                contrato.setFirmaArrendador(rs.getString("i_firmaarrendador"));
                contrato.setFirmaArrendatario(rs.getString("i_firmaarrendatario"));
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return contrato;
    }

    public List<Contrato> consultarContratosPactados(String cedulaArrendador) {
        List<Contrato> contratos = new ArrayList<>();
        String sql = "SELECT * FROM contratos WHERE k_arrendador = ? AND i_firmaarrendatario = 'F'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cedulaArrendador);
            rs = ps.executeQuery();
            while (rs.next()) {
                Contrato contrato = new Contrato();
                contrato.setIdContrato(rs.getInt("k_contrato"));
                contrato.setFechaCreacion(rs.getString("f_creacion"));
                contrato.setFechaFirma(rs.getString("f_firma"));
                contrato.setFechaInicio(rs.getString("f_inicio"));
                contrato.setFechaFinalizacion(rs.getString("f_finalizacion"));
                contrato.setCedulaArrendador(rs.getString("k_arrendador"));
                contrato.setCedulaArrendatario(rs.getString("k_arrendatario"));
                contrato.setCodigoInmueble(rs.getInt("k_propiedad"));
                contrato.setCanonPactado(rs.getInt("v_canonpactado"));
                contrato.setPeriodoFacturacion(rs.getInt("v_periodofacturacion"));
                contrato.setTerminosycondicionesContrato(rs.getString("o_terminosycondiciones"));
                contrato.setFirmaArrendador(rs.getString("i_firmaarrendador"));
                contrato.setFirmaArrendatario(rs.getString("i_firmaarrendatario"));
                contratos.add(contrato);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return contratos;
    }


    public String[] consultarPeriodoFacturacion(int idContrato){
        String[] datos = new String[6];

        String sql = "select k_contrato, k_propiedad, f_inicio, f_finalizacion, v_canonpactado, v_periodofacturacion from CONTRATOS where k_contrato = '"+idContrato+"' and i_firmaarrendador = 'F' and i_firmaarrendatario = 'P' and i_estadocontrato = 'A'";

        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()){
                datos[0] = rs.getString("k_contrato");
                datos[1] = rs.getString("k_propiedad");
                datos[2] = rs.getString("f_inicio");
                datos[3] = rs.getString("f_finalizacion");
                datos[4] = rs.getString("v_canonpactado");
                datos[5] = String.valueOf(rs.getInt("v_periodofacturacion"));
            }

        }catch (Exception e){
            System.out.println("Error: " + e);
        }
        return datos;
    }

    public boolean firmarContrato(int idContrato) {
        String sql = "UPDATE contratos SET F_FIRMA = now(), I_FIRMAARRENDATARIO = 'F', I_ESTADOCONTRATO = 'F' WHERE (K_CONTRATO = '"+idContrato+"')";
        try{
            String[] datos;

            datos = consultarPeriodoFacturacion(idContrato);

                PagoDAO pago = new PagoDAO();
                PropiedadDAO propiedad = new PropiedadDAO();

                propiedad.cambiarVisibilidadInmueble(Integer.parseInt(datos[1]));
                boolean b = pago.registrarPlandePagos(Integer.parseInt(datos[0]), datos[2], datos[3], Integer.parseInt(datos[4]), Integer.parseInt(datos[5]));
                System.out.println(b);
                con = cn.getConnection();
                ps = con.prepareStatement(sql);
                ps.executeUpdate();
                return b;
        }catch (Exception e){
            return false;
        }
    }

    public boolean cancelarContrato(int idContrato) {
        String sql = "UPDATE contratos SET I_ESTADOCONTRATO = 'C' WHERE (K_CONTRATO = '"+idContrato+"')";

        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

            return true;
        }catch (Exception e){
            return false;
        }
    }
}
