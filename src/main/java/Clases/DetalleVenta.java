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
import javax.persistence.JoinColumns;
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
@Table(name = "detalle_venta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetalleVenta.findAll", query = "SELECT d FROM DetalleVenta d"),
    @NamedQuery(name = "DetalleVenta.findByProductoIdproducto", query = "SELECT d FROM DetalleVenta d WHERE d.detalleVentaPK.productoIdproducto = :productoIdproducto"),
    @NamedQuery(name = "DetalleVenta.findByCantidad", query = "SELECT d FROM DetalleVenta d WHERE d.cantidad = :cantidad"),
    @NamedQuery(name = "DetalleVenta.findByVentaIdventa", query = "SELECT d FROM DetalleVenta d WHERE d.detalleVentaPK.ventaIdventa = :ventaIdventa"),
    @NamedQuery(name = "DetalleVenta.findByVentaUsuarioIdusuario", query = "SELECT d FROM DetalleVenta d WHERE d.detalleVentaPK.ventaUsuarioIdusuario = :ventaUsuarioIdusuario")})
public class DetalleVenta implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected DetalleVentaPK detalleVentaPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidad")
    private int cantidad;
    @JoinColumn(name = "producto_idproducto", referencedColumnName = "idproducto", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Producto producto;
    @JoinColumns({
        @JoinColumn(name = "venta_idventa", referencedColumnName = "idventa", insertable = false, updatable = false),
        @JoinColumn(name = "venta_usuario_idusuario", referencedColumnName = "usuario_idusuario", insertable = false, updatable = false)})
    @ManyToOne(optional = false)
    private Venta venta;

    public DetalleVenta() {
    }

    public DetalleVenta(DetalleVentaPK detalleVentaPK) {
        this.detalleVentaPK = detalleVentaPK;
    }

    public DetalleVenta(DetalleVentaPK detalleVentaPK, int cantidad) {
        this.detalleVentaPK = detalleVentaPK;
        this.cantidad = cantidad;
    }

    public DetalleVenta(int productoIdproducto, int ventaIdventa, int ventaUsuarioIdusuario) {
        this.detalleVentaPK = new DetalleVentaPK(productoIdproducto, ventaIdventa, ventaUsuarioIdusuario);
    }

    public DetalleVentaPK getDetalleVentaPK() {
        return detalleVentaPK;
    }

    public void setDetalleVentaPK(DetalleVentaPK detalleVentaPK) {
        this.detalleVentaPK = detalleVentaPK;
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

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (detalleVentaPK != null ? detalleVentaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetalleVenta)) {
            return false;
        }
        DetalleVenta other = (DetalleVenta) object;
        if ((this.detalleVentaPK == null && other.detalleVentaPK != null) || (this.detalleVentaPK != null && !this.detalleVentaPK.equals(other.detalleVentaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.DetalleVenta[ detalleVentaPK=" + detalleVentaPK + " ]";
    }
    
}
