/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Despacho;

/**
 *
 * @author chris
 */
public class Address {
    private int addressId;    
    private String codigoComuna;
    private String nombreCalle;
    private int numeracionCalle;
    private boolean entregaOficina;
    private String detallesAdicionales;
    private String tipoDireccion;
    private String observaciones;

    public Address(int addressId, String codigoComuna, String nombreCalle, int numeracionCalle, boolean entregaOficina, String detallesAdicionales, String tipoDireccion, String observaciones) {
        this.addressId = addressId;
        this.codigoComuna = codigoComuna;
        this.nombreCalle = nombreCalle;
        this.numeracionCalle = numeracionCalle;
        this.entregaOficina = entregaOficina;
        this.detallesAdicionales = detallesAdicionales;
        this.tipoDireccion = tipoDireccion;
        this.observaciones = observaciones;
    }
    public Address() {
        this.addressId = 0;
        this.codigoComuna = "";
        this.nombreCalle = "";
        this.numeracionCalle = 0;
        this.entregaOficina = false;
        this.detallesAdicionales = "";
        this.tipoDireccion = "";
        this.observaciones = "";
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public String getCodigoComuna() {
        return codigoComuna;
    }

    public void setCodigoComuna(String codigoComuna) {
        this.codigoComuna = codigoComuna;
    }

    public String getNombreCalle() {
        return nombreCalle;
    }

    public void setNombreCalle(String nombreCalle) {
        this.nombreCalle = nombreCalle;
    }

    public int getNumeracionCalle() {
        return numeracionCalle;
    }

    public void setNumeracionCalle(int numeracionCalle) {
        this.numeracionCalle = numeracionCalle;
    }

    public boolean isEntregaOficina() {
        return entregaOficina;
    }

    public void setEntregaOficina(boolean entregaOficina) {
        this.entregaOficina = entregaOficina;
    }

    public String getDetallesAdicionales() {
        return detallesAdicionales;
    }

    public void setDetallesAdicionales(String detallesAdicionales) {
        this.detallesAdicionales = detallesAdicionales;
    }

    public String getTipoDireccion() {
        return tipoDireccion;
    }

    public void setTipoDireccion(String tipoDireccion) {
        this.tipoDireccion = tipoDireccion;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
    
    
}
