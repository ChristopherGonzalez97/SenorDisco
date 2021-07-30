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
public class DetalleVentaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "producto_idproducto")
    private int productoIdproducto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "venta_idventa")
    private int ventaIdventa;
    @Basic(optional = false)
    @NotNull
    @Column(name = "venta_usuario_idusuario")
    private int ventaUsuarioIdusuario;

    public DetalleVentaPK() {
    }

    public DetalleVentaPK(int productoIdproducto, int ventaIdventa, int ventaUsuarioIdusuario) {
        this.productoIdproducto = productoIdproducto;
        this.ventaIdventa = ventaIdventa;
        this.ventaUsuarioIdusuario = ventaUsuarioIdusuario;
    }

    public int getProductoIdproducto() {
        return productoIdproducto;
    }

    public void setProductoIdproducto(int productoIdproducto) {
        this.productoIdproducto = productoIdproducto;
    }

    public int getVentaIdventa() {
        return ventaIdventa;
    }

    public void setVentaIdventa(int ventaIdventa) {
        this.ventaIdventa = ventaIdventa;
    }

    public int getVentaUsuarioIdusuario() {
        return ventaUsuarioIdusuario;
    }

    public void setVentaUsuarioIdusuario(int ventaUsuarioIdusuario) {
        this.ventaUsuarioIdusuario = ventaUsuarioIdusuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) productoIdproducto;
        hash += (int) ventaIdventa;
        hash += (int) ventaUsuarioIdusuario;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetalleVentaPK)) {
            return false;
        }
        DetalleVentaPK other = (DetalleVentaPK) object;
        if (this.productoIdproducto != other.productoIdproducto) {
            return false;
        }
        if (this.ventaIdventa != other.ventaIdventa) {
            return false;
        }
        if (this.ventaUsuarioIdusuario != other.ventaUsuarioIdusuario) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.DetalleVentaPK[ productoIdproducto=" + productoIdproducto + ", ventaIdventa=" + ventaIdventa + ", ventaUsuarioIdusuario=" + ventaUsuarioIdusuario + " ]";
    }
    
}
