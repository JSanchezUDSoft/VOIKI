package ModeloDAO;

import Config.Conexion;
import Interfaces.IPago;
import Modelo.Pago;

import java.sql.*;
import java.time.*;
import java.util.ArrayList;
import java.util.List;


public class PagoDAO implements IPago {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public int calcularMesesEntreFechas(LocalDate fechaInicio, LocalDate fechaFinalizacion) {
        Period periodo = Period.between(fechaInicio, fechaFinalizacion);
        return periodo.getMonths() + periodo.getYears() * 12;
    }

    public boolean registrarPlandePagos(int idContrato, String fechaInicio, String fechaFin, int valor, int periodoFacturacion) {
        try{
            int meses = calcularMesesEntreFechas(LocalDate.parse(fechaInicio), LocalDate.parse(fechaFin));
            String fechaA = fechaInicio;
            for (int i = 1; i <= meses; i++) {
                String fecha = LocalDate.parse(fechaA).plusMonths(1).toString();
                String sql = "INSERT INTO pagos (cuota, f_pago, i_pago, k_contrato) VALUES ('" + i + "', '" + fecha + "', 'P', '" + idContrato + "')";
                fechaA = fecha;
                con = cn.getConnection();
                ps = con.prepareStatement(sql);
                ps.executeUpdate();
            }

            return true;
            
        }catch (Exception e){
            System.out.println(e.toString());
            return false;
        }
    }



    public List<Pago> consultarPagos(char tipoConsulta, String valorConsulta) {
        List<Pago> pagos = new ArrayList<>();
        String sql = "";

        try {
            con = cn.getConnection();
            PreparedStatement ps;

            if (tipoConsulta == 'C') { // Consulta por cédula del arrendador
                sql = "SELECT * FROM pagos WHERE k_contrato IN (SELECT k_contrato FROM contratos WHERE k_arrendador = ?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, valorConsulta);
            } else if (tipoConsulta == 'P') { // Consulta por propiedad
                sql = "SELECT * FROM pagos WHERE k_contrato IN (SELECT k_contrato FROM contratos WHERE k_propiedad = ?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, valorConsulta);
            } else { // Consulta general de todos los pagos pendientes
                sql = "SELECT * FROM pagos WHERE i_pago = 'P'";
                ps = con.prepareStatement(sql);
            }

            rs = ps.executeQuery();

            while (rs.next()) {
                Pago pago = new Pago();
                pago.setCuota(rs.getInt("cuota"));
                pago.setFechaPago(rs.getDate("f_pago").toString());
                pago.setEstadoPago(rs.getString("i_pago").charAt(0));
                pagos.add(pago);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return pagos;
    }

    public boolean cambiarEstadoPago(int idPago, String estado) {
        String sql = "UPDATE pagos SET I_PAGO = '"+estado+"' WHERE (K_PAGO = '"+idPago+"')";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            return false;
        }
    }
    /*
    public List<Pago> consultarPagosPendientesPorMes(int mes) {
        List<Pago> lista = new ArrayList<>();
        String sql = "SELECT * FROM Pagos WHERE MONTH(fecha_vencimiento) = ? AND estado = 'pendiente'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, mes);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pago pago = new Pago();
                pago.setCuota(rs.getDouble("cuota"));
                pago.setFechaPago(rs.getDate("fecha_vencimiento"));
                pago.setEstadoPago(rs.getString("estado"));
                lista.add(pago);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }*/

}
