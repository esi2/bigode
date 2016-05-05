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
        
        
}
