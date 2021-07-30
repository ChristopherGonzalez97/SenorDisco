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
public class Envio {
    String idEtiqueta, idRastreo;
    String etiqueta;
    public Envio() {
        this.idEtiqueta = "";
        this.idRastreo = "";
        this.etiqueta = "";
    }

    public Envio(String idEtiqueta, String idRastreo,String etiqueta) {
        this.idEtiqueta = idEtiqueta;
        this.idRastreo = idRastreo;
        this.etiqueta= etiqueta;
    }

    public String getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    public String getIdEtiqueta() {
        return idEtiqueta;
    }

    public void setIdEtiqueta(String idEtiqueta) {
        this.idEtiqueta = idEtiqueta;
    }

    public String getIdRastreo() {
        return idRastreo;
    }

    public void setIdRastreo(String idRastreo) {
        this.idRastreo = idRastreo;
    }
    
    
}
