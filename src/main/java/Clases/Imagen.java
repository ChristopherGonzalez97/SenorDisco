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
import javax.persistence.Lob;
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
@Table(name = "imagen")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Imagen.findAll", query = "SELECT i FROM Imagen i"),
    @NamedQuery(name = "Imagen.findByIdimagen", query = "SELECT i FROM Imagen i WHERE i.imagenPK.idimagen = :idimagen"),
    @NamedQuery(name = "Imagen.findByHabilitado", query = "SELECT i FROM Imagen i WHERE i.habilitado = :habilitado"),
    @NamedQuery(name = "Imagen.findByProductoIdproducto", query = "SELECT i FROM Imagen i WHERE i.imagenPK.productoIdproducto = :productoIdproducto"),
    @NamedQuery(name = "Imagen.findByPosicion", query = "SELECT i FROM Imagen i WHERE i.posicion = :posicion")})
public class Imagen implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ImagenPK imagenPK;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Column(name = "imagen")
    private byte[] imagen;
    @Basic(optional = false)
    @NotNull
    @Column(name = "habilitado")
    private short habilitado;
    @Basic(optional = false)
    @NotNull
    @Column(name = "posicion")
    private int posicion;
    @JoinColumn(name = "producto_idproducto", referencedColumnName = "idproducto", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Producto producto;

    public Imagen() {
    }

    public Imagen(ImagenPK imagenPK) {
        this.imagenPK = imagenPK;
    }

    public Imagen(ImagenPK imagenPK, byte[] imagen, short habilitado, int posicion) {
        this.imagenPK = imagenPK;
        this.imagen = imagen;
        this.habilitado = habilitado;
        this.posicion = posicion;
    }

    public Imagen(int idimagen, int productoIdproducto) {
        this.imagenPK = new ImagenPK(idimagen, productoIdproducto);
    }

    public ImagenPK getImagenPK() {
        return imagenPK;
    }

    public void setImagenPK(ImagenPK imagenPK) {
        this.imagenPK = imagenPK;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    public short getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(short habilitado) {
        this.habilitado = habilitado;
    }

    public int getPosicion() {
        return posicion;
    }

    public void setPosicion(int posicion) {
        this.posicion = posicion;
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
        hash += (imagenPK != null ? imagenPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Imagen)) {
            return false;
        }
        Imagen other = (Imagen) object;
        if ((this.imagenPK == null && other.imagenPK != null) || (this.imagenPK != null && !this.imagenPK.equals(other.imagenPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.Imagen[ imagenPK=" + imagenPK + " ]";
    }
    
}
