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
public class DespachoEnviame {
    String empresa,codEnvio;
    int valor;

    public DespachoEnviame(String empresa, String codEnvio, int valor) {
        this.empresa = empresa;
        this.codEnvio = codEnvio;
        this.valor = valor;
    }

    public DespachoEnviame() {
        this.empresa = "";
        this.codEnvio = "";
        this.valor = 0;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public String getCodEnvio() {
        return codEnvio;
    }

    public void setCodEnvio(String codEnvio) {
        this.codEnvio = codEnvio;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
    
    
}
