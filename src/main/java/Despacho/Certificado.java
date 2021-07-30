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
public class Certificado {
    private int numeroCertificado;
    public Certificado(int numeroCertificado) {
        this.numeroCertificado = numeroCertificado;
    }
    public Certificado() {
        this.numeroCertificado =0;
    }

    public int getNumeroCertificado() {
        return numeroCertificado;
    }

    public void setNumeroCertificado(int numeroCertificado) {
        this.numeroCertificado = numeroCertificado;
    }
    
}
