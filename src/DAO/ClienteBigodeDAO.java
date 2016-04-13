package DAO;

//[12.04.2016 HEBERT] - Implementacao DAO

public class ClienteBigodeDAO implements BigodeDAO{

	//[12.04.2016 HEBERT] - Implementacao DAO
	@Override
	public String allBarUnionMesa(int bar, int mesa) {
		return "SELECT * FROM BAR UNION MESA "
				+ "WHERE ID_BAR = " + bar
				+ " AND NUM_MESA = " + mesa + ";";
	}

}
