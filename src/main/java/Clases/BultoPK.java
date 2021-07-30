/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author pc
 */
@Embeddable
public class BultoPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idBulto")
    private int idBulto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "despacho_iddespacho")
    private int despachoIddespacho;

    public BultoPK() {
    }

    public BultoPK(int idBulto, int despachoIddespacho) {
        this.idBulto = idBulto;
        this.despachoIddespacho = despachoIddespacho;
    }

    public int getIdBulto() {
        return idBulto;
    }

    public void setIdBulto(int idBulto) {
        this.idBulto = idBulto;
    }

    public int getDespachoIddespacho() {
        return despachoIddespacho;
    }

    public void setDespachoIddespacho(int despachoIddespacho) {
        this.despachoIddespacho = despachoIddespacho;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idBulto;
        hash += (int) despachoIddespacho;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BultoPK)) {
            return false;
        }
        BultoPK other = (BultoPK) object;
        if (this.idBulto != other.idBulto) {
            return false;
        }
        if (this.despachoIddespacho != other.despachoIddespacho) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.BultoPK[ idBulto=" + idBulto + ", despachoIddespacho=" + despachoIddespacho + " ]";
    }
    
}
