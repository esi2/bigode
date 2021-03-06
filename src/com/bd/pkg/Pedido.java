/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bd.pkg;

import Commons.ProdutoPedido;
import DAO.BigodeDAO;
import DAO.BigodeDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.*;

/**
 *
 * @author Favoretti
 */
@WebServlet("/Pedido")
public class Pedido extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Pedido</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Pedido at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Recebe String do pedido e num mesa => pedido | numMesa
        String pedido = request.getParameter("jsonPedido");
        String sessao = request.getParameter("sessao");
        String flag = request.getParameter("flag");
        System.out.println("PEDIDO"+ pedido);
        
        Gson gson = new Gson();
        //Come�a tratar objeto Json como array
        JsonParser parser = new JsonParser();
        JsonArray Jarray = (JsonArray) parser.parse(pedido).getAsJsonObject().getAsJsonArray("list");
        BigodeDAO bgd = new BigodeDAOImpl(); 
        //A cada elemento do array de Json atribui para a classe e insere
        int cont =0;
        int numMesa = 0;
       
        
        for (JsonElement obj : Jarray) {
         int idP = bgd.checaPedido(Integer.parseInt(sessao));
         ProdutoPedido pp =  gson.fromJson(obj, ProdutoPedido.class);
         if(pp.getMesa() != 0){
         if(idP == 0 || flag.equals("n") ){
                 idP = bgd.inserePedido(pp.getId(), pp.getQty(), pp.getMesa(), Integer.parseInt(sessao));
                 flag = "s";
         }              
         
         
         if(pp.getQty() > 0){
            
             
         bgd.inserePedido2(idP, pp.getId(), pp.getQty(), pp.getMesa(), Integer.parseInt(sessao));
         numMesa = pp.getMesa();
        
         }
         }}
        
        response.sendRedirect("pedido_confirmado.jsp?msg=pedido&codMesa="+numMesa+"&sessao="+sessao);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
