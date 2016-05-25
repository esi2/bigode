package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bd.pkg.ConnectionManager;
import com.mysql.jdbc.Statement;

//[12.04.2016 HEBERT] - Implementacao DAO
public class BigodeDAOImpl implements BigodeDAO {

    // [12.04.2016 HEBERT] - Implementacao DAO
    @Override
    public boolean checaBarMesa(int bar, int mesa) {
        Statement st;
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();

            String sql = "SELECT * FROM BAR JOIN MESA ON BAR.ID_BAR = MESA.ID_BAR WHERE BAR.ID_BAR=" + bar
                    + " AND MESA.NUM_MESA=" + mesa;
            System.out.println(sql);
            st = (Statement) conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                return true;
            }
            ConnectionManager.getInstance().close();
        } catch (Exception e) {
            System.out.println("Erro: " + e.toString());
        }

        return false;

    }

    @Override
    public ArrayList<String> listaProduto(int id_bar) {
        ArrayList<String> result = new ArrayList<String>();
        Statement st;
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();

            String sql = "SELECT NOME_PRODUTO, PRECO_PRODUTO, FOTO_PRODUTO, ID_PRODUTO FROM PRODUTO WHERE ID_BAR=" + id_bar;

            st = (Statement) conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                result.add(rs.getString(1));
                result.add(rs.getString(2));
                result.add(rs.getString(3));
                result.add(rs.getString(4));

            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.toString());
        }
        ConnectionManager.getInstance().close();
        return result;
    }

    @Override
    public String getNomeBar(int idBar) {
        String result = "";
        Statement st;
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();

            String sql = "SELECT NOME_BAR from BAR where ID_BAR=" + idBar;

            st = (Statement) conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                result = rs.getString(1);

            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.toString());
        }
        ConnectionManager.getInstance().close();
        return result;
    }

    @Override
    public void inserePedido(int id, int qtd, int numMesa, int idSessao) {
        Connection conn = ConnectionManager.getInstance().getConnection();
        String insertPedido = "INSERT INTO PEDIDO VALUES (null," + numMesa + ", 'ativo', " + idSessao + ", " + id + ", " + qtd + " )";
        Statement st;
        try {
            st = (Statement) conn.createStatement();
            st.execute(insertPedido);

        } catch (Exception e) {
            System.out.println("Erro: " + e.toString());
        }

        ConnectionManager.getInstance().close();
    }

    @Override
    public int registraSession(int idMesa, String inicio, String fim, String status, int preco, int credito) {
        Connection conn = ConnectionManager.getInstance().getConnection();
        java.util.Date dt = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int auto_id = 0;
        String currentTime = sdf.format(dt);

        String insertPedido = "INSERT INTO SESSAO VALUES (null," + idMesa + ",'" + currentTime + "', null, 'ativo', '0.00', '0.00')";
        System.out.println(insertPedido);
        PreparedStatement stmt;
        try {
            stmt = conn.prepareStatement(insertPedido, Statement.RETURN_GENERATED_KEYS);
            stmt.executeUpdate(insertPedido, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            auto_id = rs.getInt(1);
            System.out.println(auto_id);

        } catch (Exception e) {
            System.out.println("Erro: " + e.toString());
        }
        ConnectionManager.getInstance().close();
        return auto_id;
    }
}
