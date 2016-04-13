package com.bd.pkg;

//[12.04.2016 HEBERT] - Implementacao DAO

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ClienteBigodeDAO;

/**
 * Servlet implementation class ConectaEstabelecimento
 */
@WebServlet("/ConectaEstabelecimento")
public class ConectaEstabelecimento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConectaEstabelecimento() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		String codMesa = request.getParameter("codigoMesa");
		
		try {
			// Ex: codMesa = 1_3 -> bar: 1, mesa: 3
			// codMesa = 1023_43 -> bar:1023, mesa: 43
			
			String[] codMesaAux = new String[2];
			codMesaAux = codMesa.split("_");
			int bar = Integer.parseInt(codMesaAux[0]);
			int mesa = Integer.parseInt(codMesaAux[1]);
			
			Connection conn = ConnectionManager.getInstance().getConnection();
			
			//[12.04.2016 HEBERT] - Implementacao DAO
			ClienteBigodeDAO clienteDAO = new ClienteBigodeDAO();
			String sql = clienteDAO.allBarUnionMesa(bar, mesa);
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs =	pstmt.executeQuery();
			int confirmacaoBar = rs.findColumn("ID_BAR");
			int confirmacaoMesa = rs.findColumn("NUM_MESA");
			if(confirmacaoBar==bar && confirmacaoMesa==mesa){
				response.sendRedirect("http://localhost:8080/bigode/menu.jsp?"+codMesa);	
			}else{
				response.sendRedirect("http://localhost:8080/bigode/index.jsp");	
			}
			
		} catch (Exception e) {
			System.out.println("Erro: " + e.toString());
			response.sendRedirect("http://localhost:8080/bigode/index.jsp?"+codMesa);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
