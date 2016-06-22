package DAO;

import java.util.ArrayList;

//[12.04.2016 HEBERT] - Implementacao DAO

public interface BigodeDAO {
	
	/*Implementacao DAO
	 * @return Retorna todos os dados da Union BAR com MESA
	 */
	public boolean checaBarMesa(int bar, int mesa);
	
	/**
	 * Lista de produtos no banco
	 * @param id_bar
	 * @return
	 */
	public ArrayList<String> listaProduto(int id_bar);
        
        /**
         * 
         * @param idBar
         * @return 
         */
        public String getNomeBar(int idBar);
        
        /**
         * Insere o id de pedido
         * @param id
         * @param qtd 
         * @param numMesa
     * @param idSessao
     * @return 
         */
        public int inserePedido(int id, int qtd, int numMesa, int idSessao);
        
        
        
        /**
         * insere na tabela pedido_produtos
     * @param pedidoID
         * @param id
         * @param qtd
         * @param numMesa
         * @param idSessao 
         */
        public void inserePedido2(int pedidoID, int id, int qtd, int numMesa, int idSessao);
        
        
        
        
        /**
         * 
         * @param id
         * @param idMesa
         * @param inicio
         * @param fim
         * @param status
         * @param preco
         * @param credito 
         */
        public int registraSession(int idMesa, String inicio, String fim, String status, int preco, int credito);
       
        public int checaSessao (int idMesa);
        
        public int checaPedido (int idSessao);
       
        public ArrayList<String> listaPedidos (int idSessao);
        
        public void sessaoPagamento (int idSessao, double preco);
}
