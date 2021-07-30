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
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "comuna")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comuna.findAll", query = "SELECT c FROM Comuna c"),
    @NamedQuery(name = "Comuna.findByIdcomuna", query = "SELECT c FROM Comuna c WHERE c.comunaPK.idcomuna = :idcomuna"),
    @NamedQuery(name = "Comuna.findByNombre", query = "SELECT c FROM Comuna c WHERE c.nombre = :nombre"),
    @NamedQuery(name = "Comuna.findByRegionIdregion", query = "SELECT c FROM Comuna c WHERE c.comunaPK.regionIdregion = :regionIdregion")})
public class Comuna implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ComunaPK comunaPK;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre")
    private String nombre;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "comuna")
    private List<Cliente> clienteList;
    @JoinColumn(name = "region_idregion", referencedColumnName = "idregion", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Region region;

    public Comuna() {
    }

    public Comuna(ComunaPK comunaPK) {
        this.comunaPK = comunaPK;
    }

    public Comuna(ComunaPK comunaPK, String nombre) {
        this.comunaPK = comunaPK;
        this.nombre = nombre;
    }

    public Comuna(int idcomuna, int regionIdregion) {
        this.comunaPK = new ComunaPK(idcomuna, regionIdregion);
    }

    public ComunaPK getComunaPK() {
        return comunaPK;
    }

    public void setComunaPK(ComunaPK comunaPK) {
        this.comunaPK = comunaPK;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @XmlTransient
    public List<Cliente> getClienteList() {
        return clienteList;
    }

    public void setClienteList(List<Cliente> clienteList) {
        this.clienteList = clienteList;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (comunaPK != null ? comunaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comuna)) {
            return false;
        }
        Comuna other = (Comuna) object;
        if ((this.comunaPK == null && other.comunaPK != null) || (this.comunaPK != null && !this.comunaPK.equals(other.comunaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.Comuna[ comunaPK=" + comunaPK + " ]";
    }
    
}
