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
        return null;
    }

    public ArrayList<List<Object>> consultarPeriodoFacturacion(int idContrato){

        ArrayList<List<Object>> list = new ArrayList<>();
        String sql = "select k_contrato, f_inicio, f_finalizacion, v_canonpactado, v_periodofacturacion from CONTRATOS where k_contrato = '"+idContrato+"' and i_firmaarrrendador = 'f' and i_firmaarrendatario = 'f' and i_estadocontrato = 'A'";

        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                List<Object> row = new ArrayList<>();
                row.add(rs.getString("k_contrato"));
                row.add(rs.getString("f_inicio"));
                row.add(rs.getString("f_finalizacion"));
                row.add(rs.getString("v_canonpactado"));
                row.add(rs.getInt("v_periodofacturacion"));
                list.add(row);
            }

        }catch (Exception e){
            System.out.println("Error: " + e);
        }
        return list;
    }

    public boolean firmarContrato(int idContrato) {
        String sql = "UPDATE contratos SET F_FIRMA = now(), I_FIRMAARRENDATARIO = 'F', I_ESTADOCONTRATO = 'F' WHERE (K_CONTRATO = '"+idContrato+"')";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

            ArrayList<List<Object>> datosContrato = consultarPeriodoFacturacion(idContrato);

            // Verificación de que hay datos
            if (!datosContrato.isEmpty()) {
                // Acceder a la primera fila de datos
                List<Object> primeraFila = datosContrato.get(0);

                // Acceder a cada valor individualmente e imprimirlo
                int kContrato = (int) primeraFila.get(0);
                String fInicio = (String) primeraFila.get(1);
                String fFinalizacion = (String) primeraFila.get(2);
                int vCanonPactado = (int) primeraFila.get(3);
                int vPeriodoFacturacion = (int) primeraFila.get(4);

                PagoDAO pago = new PagoDAO();

                return pago.registrarPlandePagos(kContrato, fInicio, fFinalizacion, vCanonPactado, vPeriodoFacturacion);

            } else {
                System.out.println("No se encontraron datos para el contrato con ID: " + idContrato);
                return false;
            }
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
