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
public class Contacto {
    private String nombre;
    private String numero;
    private String mail;
    private String tipoContacto;

    public Contacto() {
        this.nombre = "";
        this.numero = "";
        this.mail = "";
        this.tipoContacto = "";
    }

    public Contacto(String nombre, String numero, String mail, String tipoContacto) {
        this.nombre = nombre;
        this.numero = numero;
        this.mail = mail;
        this.tipoContacto = tipoContacto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getTipoContacto() {
        return tipoContacto;
    }

    public void setTipoContacto(String tipoContacto) {
        this.tipoContacto = tipoContacto;
    }
    
    
}
