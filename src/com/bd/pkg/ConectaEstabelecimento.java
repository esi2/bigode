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

import DAO.BigodeDAOImpl;

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
		
		// Ex: codMesa = 1_3 -> bar: 1, mesa: 3
			// codMesa = 1023_43 -> bar:1023, mesa: 43
			
			String[] codMesaAux = new String[2];
			codMesaAux = codMesa.split("_");
			int bar = Integer.parseInt(codMesaAux[0]);
			int mesa = Integer.parseInt(codMesaAux[1]);
			
			
			
			BigodeDAOImpl clienteDAO = new BigodeDAOImpl();
			System.out.println(clienteDAO.checaBarMesa(bar, mesa));
			
			if(clienteDAO.checaBarMesa(bar, mesa)){
				response.sendRedirect("menu.jsp?codMesa="+mesa+"&bar="+bar);	
			}else{
				response.sendRedirect("index.jsp?msg=Erro");	
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
