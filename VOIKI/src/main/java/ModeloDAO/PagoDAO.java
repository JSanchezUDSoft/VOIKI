package ModeloDAO;

import Config.Conexion;
import Interfaces.IPago;
import Modelo.Pago;

import java.sql.*;
import java.time.*;

public class PagoDAO implements IPago {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public int calcularMesesEntreFechas(LocalDate fechaInicio, LocalDate fechaFinalizacion) {
        Period periodo = Period.between(fechaInicio, fechaFinalizacion);
        return periodo.getMonths() + periodo.getYears() * 12;
    }

    public boolean registrarPlandePagos(int idPago, String fechaInicio, String fechaFin, int valor, int periodoFacturacion) {
        try{
            int meses = calcularMesesEntreFechas(LocalDate.parse(fechaInicio), LocalDate.parse(fechaFin));

            for (int i = 1; i <= meses; i++) {
                String fecha = LocalDate.parse(fechaInicio).plusMonths(1).toString();
                String sql = "INSERT INTO pagos (cuota, f_pago, i_pago, k_contrato) VALUES ('" + i + "', '" + fecha + "', 'P', '" + idPago + "')";
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

    public Pago consultarPagos(char tipoConsulta, String valorConsulta) {
    Pago pago = null;
    String sql = "SELECT * FROM pagos WHERE k_contrato = ?";

    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, valorConsulta);
        rs = ps.executeQuery();

        if (rs.next()) {
            pago = new Pago();
            pago.setCuota(rs.getInt("cuota"));
            pago.setFechaPago(rs.getDate("f_pago").toString());
            pago.setEstadoPago(rs.getString("i_pago").charAt(0));
        }
    } catch (SQLException e) {
        System.out.println("Error: " + e);
    }

    return pago;
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
}
