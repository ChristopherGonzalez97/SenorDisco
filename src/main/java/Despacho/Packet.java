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
public class Packet {
    private double weight;
    private int height;
    private int width;
    private int length;
    private int codigoDeEntrega;
    private int codigoProducto;
    private String referenciaEnvio;
    private String grupoReferencia;
    private int valorProducto;
    private int tipoProducto;
    private char coberturaExtendida;

    public Packet() {
        this.weight = 0;
        this.height = 0;
        this.width =0;
        this.length =0;
        this.codigoDeEntrega = 0;
        this.codigoProducto = 0;
        this.referenciaEnvio = "";
        this.grupoReferencia = "";
        this.valorProducto = 0;
        this.tipoProducto = 0;
        this.coberturaExtendida = '0';
    }

    public Packet(double weight, int height, int width, int length, int codigoDeEntrega, int codigoProducto, String referenciaEnvio, String grupoReferencia, int valorProducto, int tipoProducto, char coberturaExtendida) {
        this.weight = weight;
        this.height = height;
        this.width = width;
        this.length = length;
        this.codigoDeEntrega = codigoDeEntrega;
        this.codigoProducto = codigoProducto;
        this.referenciaEnvio = referenciaEnvio;
        this.grupoReferencia = grupoReferencia;
        this.valorProducto = valorProducto;
        this.tipoProducto = tipoProducto;
        this.coberturaExtendida = coberturaExtendida;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getCodigoDeEntrega() {
        return codigoDeEntrega;
    }

    public void setCodigoDeEntrega(int codigoDeEntrega) {
        this.codigoDeEntrega = codigoDeEntrega;
    }

    public int getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getReferenciaEnvio() {
        return referenciaEnvio;
    }

    public void setReferenciaEnvio(String referenciaEnvio) {
        this.referenciaEnvio = referenciaEnvio;
    }

    public String getGrupoReferencia() {
        return grupoReferencia;
    }

    public void setGrupoReferencia(String grupoReferencia) {
        this.grupoReferencia = grupoReferencia;
    }

    public int getValorProducto() {
        return valorProducto;
    }

    public void setValorProducto(int valorProducto) {
        this.valorProducto = valorProducto;
    }

    public int getTipoProducto() {
        return tipoProducto;
    }

    public void setTipoProducto(int tipoProducto) {
        this.tipoProducto = tipoProducto;
    }

    public char getCoberturaExtendida() {
        return coberturaExtendida;
    }

    public void setCoberturaExtendida(char coberturaExtendida) {
        this.coberturaExtendida = coberturaExtendida;
    }
    
}
