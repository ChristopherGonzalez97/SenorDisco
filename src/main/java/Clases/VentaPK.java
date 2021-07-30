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
public class VentaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idventa")
    private int idventa;
    @Basic(optional = false)
    @NotNull
    @Column(name = "usuario_idusuario")
    private int usuarioIdusuario;

    public VentaPK() {
    }

    public VentaPK(int idventa, int usuarioIdusuario) {
        this.idventa = idventa;
        this.usuarioIdusuario = usuarioIdusuario;
    }

    public int getIdventa() {
        return idventa;
    }

    public void setIdventa(int idventa) {
        this.idventa = idventa;
    }

    public int getUsuarioIdusuario() {
        return usuarioIdusuario;
    }

    public void setUsuarioIdusuario(int usuarioIdusuario) {
        this.usuarioIdusuario = usuarioIdusuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idventa;
        hash += (int) usuarioIdusuario;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof VentaPK)) {
            return false;
        }
        VentaPK other = (VentaPK) object;
        if (this.idventa != other.idventa) {
            return false;
        }
        if (this.usuarioIdusuario != other.usuarioIdusuario) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.VentaPK[ idventa=" + idventa + ", usuarioIdusuario=" + usuarioIdusuario + " ]";
    }
    
}
