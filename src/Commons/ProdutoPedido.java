/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commons;

/**
 *
 * @author Favoretti
 */
public class ProdutoPedido {
    private int qty = 0;
    private int id = 0;
    private int mesa = 0;

    /**
     * @return the qtd
     */
    public int getQty() {
        return qty;
    }

    /**
     * @param qtd the qtd to set
     */
    public void setQty(int qty) {
        this.qty = qty;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the mesa
     */
    public int getMesa() {
        return mesa;
    }

    /**
     * @param mesa the mesa to set
     */
    public void setMesa(int mesa) {
        this.mesa = mesa;
    }
    
}
