/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Enviame;

/**
 *
 * @author pc
 */
public class Retiro {
    String idRetiro, fecha;
    int qty;

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public Retiro() {
        this.idRetiro = "";
        this.fecha = "";
    }

    public Retiro(String idRetiro, String fecha) {
        this.idRetiro = idRetiro;
        this.fecha = fecha;
    }

    public String getIdRetiro() {
        return idRetiro;
    }

    public void setIdRetiro(String idRetiro) {
        this.idRetiro = idRetiro;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
}
