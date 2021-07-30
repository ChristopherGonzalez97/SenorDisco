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
public class EmpleadoPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "cargo_idcargo")
    private int cargoIdcargo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "usuario_idusuario")
    private int usuarioIdusuario;

    public EmpleadoPK() {
    }

    public EmpleadoPK(int cargoIdcargo, int usuarioIdusuario) {
        this.cargoIdcargo = cargoIdcargo;
        this.usuarioIdusuario = usuarioIdusuario;
    }

    public int getCargoIdcargo() {
        return cargoIdcargo;
    }

    public void setCargoIdcargo(int cargoIdcargo) {
        this.cargoIdcargo = cargoIdcargo;
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
        hash += (int) cargoIdcargo;
        hash += (int) usuarioIdusuario;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EmpleadoPK)) {
            return false;
        }
        EmpleadoPK other = (EmpleadoPK) object;
        if (this.cargoIdcargo != other.cargoIdcargo) {
            return false;
        }
        if (this.usuarioIdusuario != other.usuarioIdusuario) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.EmpleadoPK[ cargoIdcargo=" + cargoIdcargo + ", usuarioIdusuario=" + usuarioIdusuario + " ]";
    }
    
}
