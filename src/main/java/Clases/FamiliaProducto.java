/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author pc
 */
@Entity
@Table(name = "familia_producto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "FamiliaProducto.findAll", query = "SELECT f FROM FamiliaProducto f"),
    @NamedQuery(name = "FamiliaProducto.findByIdfamiliaProducto", query = "SELECT f FROM FamiliaProducto f WHERE f.idfamiliaProducto = :idfamiliaProducto"),
    @NamedQuery(name = "FamiliaProducto.findByNombre", query = "SELECT f FROM FamiliaProducto f WHERE f.nombre = :nombre")})
public class FamiliaProducto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idfamilia_producto")
    private Integer idfamiliaProducto;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre")
    private String nombre;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "familiaProductoIdfamiliaProducto")
    private List<Producto> productoList;

    public FamiliaProducto() {
    }

    public FamiliaProducto(Integer idfamiliaProducto) {
        this.idfamiliaProducto = idfamiliaProducto;
    }

    public FamiliaProducto(Integer idfamiliaProducto, String nombre) {
        this.idfamiliaProducto = idfamiliaProducto;
        this.nombre = nombre;
    }

    public Integer getIdfamiliaProducto() {
        return idfamiliaProducto;
    }

    public void setIdfamiliaProducto(Integer idfamiliaProducto) {
        this.idfamiliaProducto = idfamiliaProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @XmlTransient
    public List<Producto> getProductoList() {
        return productoList;
    }

    public void setProductoList(List<Producto> productoList) {
        this.productoList = productoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idfamiliaProducto != null ? idfamiliaProducto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FamiliaProducto)) {
            return false;
        }
        FamiliaProducto other = (FamiliaProducto) object;
        if ((this.idfamiliaProducto == null && other.idfamiliaProducto != null) || (this.idfamiliaProducto != null && !this.idfamiliaProducto.equals(other.idfamiliaProducto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.FamiliaProducto[ idfamiliaProducto=" + idfamiliaProducto + " ]";
    }
    
}
