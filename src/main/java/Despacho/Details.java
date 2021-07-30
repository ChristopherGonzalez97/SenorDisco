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
public class Details {
    
private Address addressDest;
private Address addressDev;
private Contacto contactoR;
private Contacto contactoD;

    public Details() {
    }

    public Details( Address addressDest, Address addressDev, Contacto contactoR, Contacto contactoD) {
        this.addressDest = addressDest;
        this.addressDev = addressDev;
        this.contactoR = contactoR;
        this.contactoD = contactoD;
    }


    public Address getAddressDest() {
        return addressDest;
    }

    public void setAddressDest(Address addressDest) {
        this.addressDest = addressDest;
    }

    public Address getAddressDev() {
        return addressDev;
    }

    public void setAddressDev(Address addressDev) {
        this.addressDev = addressDev;
    }

    public Contacto getContactoR() {
        return contactoR;
    }

    public void setContactoR(Contacto contactoR) {
        this.contactoR = contactoR;
    }

    public Contacto getContactoD() {
        return contactoD;
    }

    public void setContactoD(Contacto contactoD) {
        this.contactoD = contactoD;
    }

    

   

}
