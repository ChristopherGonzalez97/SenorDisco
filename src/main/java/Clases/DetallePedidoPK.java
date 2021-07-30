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
public class DetallePedidoPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "producto_idproducto")
    private int productoIdproducto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "pedido_idpedido")
    private int pedidoIdpedido;

    public DetallePedidoPK() {
    }

    public DetallePedidoPK(int productoIdproducto, int pedidoIdpedido) {
        this.productoIdproducto = productoIdproducto;
        this.pedidoIdpedido = pedidoIdpedido;
    }

    public int getProductoIdproducto() {
        return productoIdproducto;
    }

    public void setProductoIdproducto(int productoIdproducto) {
        this.productoIdproducto = productoIdproducto;
    }

    public int getPedidoIdpedido() {
        return pedidoIdpedido;
    }

    public void setPedidoIdpedido(int pedidoIdpedido) {
        this.pedidoIdpedido = pedidoIdpedido;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) productoIdproducto;
        hash += (int) pedidoIdpedido;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetallePedidoPK)) {
            return false;
        }
        DetallePedidoPK other = (DetallePedidoPK) object;
        if (this.productoIdproducto != other.productoIdproducto) {
            return false;
        }
        if (this.pedidoIdpedido != other.pedidoIdpedido) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.DetallePedidoPK[ productoIdproducto=" + productoIdproducto + ", pedidoIdpedido=" + pedidoIdpedido + " ]";
    }
    
}
