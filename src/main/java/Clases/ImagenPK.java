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
public class ImagenPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idimagen")
    private int idimagen;
    @Basic(optional = false)
    @NotNull
    @Column(name = "producto_idproducto")
    private int productoIdproducto;

    public ImagenPK() {
    }

    public ImagenPK(int idimagen, int productoIdproducto) {
        this.idimagen = idimagen;
        this.productoIdproducto = productoIdproducto;
    }

    public int getIdimagen() {
        return idimagen;
    }

    public void setIdimagen(int idimagen) {
        this.idimagen = idimagen;
    }

    public int getProductoIdproducto() {
        return productoIdproducto;
    }

    public void setProductoIdproducto(int productoIdproducto) {
        this.productoIdproducto = productoIdproducto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idimagen;
        hash += (int) productoIdproducto;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ImagenPK)) {
            return false;
        }
        ImagenPK other = (ImagenPK) object;
        if (this.idimagen != other.idimagen) {
            return false;
        }
        if (this.productoIdproducto != other.productoIdproducto) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.ImagenPK[ idimagen=" + idimagen + ", productoIdproducto=" + productoIdproducto + " ]";
    }
    
}
