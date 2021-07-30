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
public class ComunaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idcomuna")
    private int idcomuna;
    @Basic(optional = false)
    @NotNull
    @Column(name = "region_idregion")
    private int regionIdregion;

    public ComunaPK() {
    }

    public ComunaPK(int idcomuna, int regionIdregion) {
        this.idcomuna = idcomuna;
        this.regionIdregion = regionIdregion;
    }

    public int getIdcomuna() {
        return idcomuna;
    }

    public void setIdcomuna(int idcomuna) {
        this.idcomuna = idcomuna;
    }

    public int getRegionIdregion() {
        return regionIdregion;
    }

    public void setRegionIdregion(int regionIdregion) {
        this.regionIdregion = regionIdregion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idcomuna;
        hash += (int) regionIdregion;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ComunaPK)) {
            return false;
        }
        ComunaPK other = (ComunaPK) object;
        if (this.idcomuna != other.idcomuna) {
            return false;
        }
        if (this.regionIdregion != other.regionIdregion) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.ComunaPK[ idcomuna=" + idcomuna + ", regionIdregion=" + regionIdregion + " ]";
    }
    
}
