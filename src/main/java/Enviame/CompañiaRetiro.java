/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Enviame;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pc
 */
public class CompañiaRetiro {
    String codRetiro;
    List<Retiro> retiroList;

    public CompañiaRetiro() {
        this.codRetiro = "";
        this.retiroList = new ArrayList<Retiro>();
    }

    public CompañiaRetiro(String codRetiro, List<Retiro> retiroList) {
        this.codRetiro = codRetiro;
        this.retiroList = retiroList;
    }

    public String getCodRetiro() {
        return codRetiro;
    }

    public void setCodRetiro(String codRetiro) {
        this.codRetiro = codRetiro;
    }

    public List<Retiro> getRetiroList() {
        return retiroList;
    }

    public void setRetiroList(List<Retiro> retiroList) {
        this.retiroList = retiroList;
    }
    
    
}
