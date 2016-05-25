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
         * 
         * @param id
         * @param qtd 
         * @param numMesa
         */
        public void inserePedido(int id, int qtd, int numMesa, int idSessao);
        
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
       
       
        
}
