package com.bd.pkg;

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
		try {
			String codMesa = request.getParameter("codigoMesa");
			Connection conn = ConnectionManager.getInstance().getConnection();
			String sql = "";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs =	pstmt.executeQuery();

			if(rs!=null){
				
			}
			response.sendRedirect("http://localhost:8080/bigode/menu.jsp");
			
		} catch (Exception e) {
			System.out.println("Erro: " + e.toString());
			response.sendRedirect("http://localhost:8080/bigode/index.jsp");
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
