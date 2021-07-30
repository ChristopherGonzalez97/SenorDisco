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
public class Header {
    private int certificadoNumero;
    private int customerCardNumber;
    private String codigoDeOrigen;
    private String tipoEtiqueta;
    private int MarketPlaceRut;
    private int SellerRut;

    public Header(int certificadoNumero, int customerCardNumber, String codigoDeOrigen, String tipoEtiqueta,int MarketPlaceRut, int SellerRut) {
        this.certificadoNumero = certificadoNumero;
        this.customerCardNumber = customerCardNumber;
        this.codigoDeOrigen = codigoDeOrigen;
        this.tipoEtiqueta = tipoEtiqueta;
        this.MarketPlaceRut=MarketPlaceRut;
        this.SellerRut = SellerRut;
    }
    public Header() {
        this.certificadoNumero = 0;
        this.customerCardNumber = 0;
        this.codigoDeOrigen = "";
        this.tipoEtiqueta = "";
        this.MarketPlaceRut=0;
        this.SellerRut = 0;
    }

    public int getMarketPlaceRut() {
        return MarketPlaceRut;
    }

    public void setMarketPlaceRut(int MarketPlaceRut) {
        this.MarketPlaceRut = MarketPlaceRut;
    }
    
    
    public int getCertificadoNumero() {
        return certificadoNumero;
    }

    public void setCertificadoNumero(int certificadoNumero) {
        this.certificadoNumero = certificadoNumero;
    }

    public int getCustomerCardNumber() {
        return customerCardNumber;
    }

    public void setCustomerCardNumber(int customerCardNumber) {
        this.customerCardNumber = customerCardNumber;
    }

    public String getCodigoDeOrigen() {
        return codigoDeOrigen;
    }

    public void setCodigoDeOrigen(String codigoDeOrigen) {
        this.codigoDeOrigen = codigoDeOrigen;
    }

    public String getTipoEtiqueta() {
        return tipoEtiqueta;
    }

    public void setTipoEtiqueta(String tipoEtiqueta) {
        this.tipoEtiqueta = tipoEtiqueta;
    }

    public int getSellerRut() {
        return SellerRut;
    }

    public void setSellerRut(int SellerRut) {
        this.SellerRut = SellerRut;
    }
    
    
}
