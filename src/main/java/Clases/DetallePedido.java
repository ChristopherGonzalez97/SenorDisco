/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author pc
 */
@Entity
@Table(name = "detalle_pedido")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetallePedido.findAll", query = "SELECT d FROM DetallePedido d"),
    @NamedQuery(name = "DetallePedido.findByProductoIdproducto", query = "SELECT d FROM DetallePedido d WHERE d.detallePedidoPK.productoIdproducto = :productoIdproducto"),
    @NamedQuery(name = "DetallePedido.findByPedidoIdpedido", query = "SELECT d FROM DetallePedido d WHERE d.detallePedidoPK.pedidoIdpedido = :pedidoIdpedido"),
    @NamedQuery(name = "DetallePedido.findByCantidad", query = "SELECT d FROM DetallePedido d WHERE d.cantidad = :cantidad")})
public class DetallePedido implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected DetallePedidoPK detallePedidoPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidad")
    private int cantidad;
    @JoinColumn(name = "pedido_idpedido", referencedColumnName = "idpedido", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Pedido pedido;
    @JoinColumn(name = "producto_idproducto", referencedColumnName = "idproducto", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Producto producto;

    public DetallePedido() {
    }

    public DetallePedido(DetallePedidoPK detallePedidoPK) {
        this.detallePedidoPK = detallePedidoPK;
    }

    public DetallePedido(DetallePedidoPK detallePedidoPK, int cantidad) {
        this.detallePedidoPK = detallePedidoPK;
        this.cantidad = cantidad;
    }

    public DetallePedido(int productoIdproducto, int pedidoIdpedido) {
        this.detallePedidoPK = new DetallePedidoPK(productoIdproducto, pedidoIdpedido);
    }

    public DetallePedidoPK getDetallePedidoPK() {
        return detallePedidoPK;
    }

    public void setDetallePedidoPK(DetallePedidoPK detallePedidoPK) {
        this.detallePedidoPK = detallePedidoPK;
    }
    public int getTotalProducto()
    {
        int total=0;
        
        total=this.getCantidad()*this.getProducto().getPrecioVenta();
        
        return total;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (detallePedidoPK != null ? detallePedidoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetallePedido)) {
            return false;
        }
        DetallePedido other = (DetallePedido) object;
        if ((this.detallePedidoPK == null && other.detallePedidoPK != null) || (this.detallePedidoPK != null && !this.detallePedidoPK.equals(other.detallePedidoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.DetallePedido[ detallePedidoPK=" + detallePedidoPK + " ]";
    }
    
}
