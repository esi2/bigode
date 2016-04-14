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

			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next())
				return true;

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

				String sql = "SELECT NOME_PRODUTO, PRECO_PRODUTO, FOTO_PRODUTO FROM PRODUTO WHERE ID_BAR="+id_bar;

				st = (Statement) conn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				while (rs.next()){
					result.add(rs.getString(1));
					result.add(rs.getString(2));
					result.add(rs.getString(3));
					
				}
					

			} catch (Exception e) {
				System.out.println("Erro: " + e.toString());
			}

			return result;
	}
}