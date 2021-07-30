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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author pc
 */
@Entity
@Table(name = "bulto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bulto.findAll", query = "SELECT b FROM Bulto b"),
    @NamedQuery(name = "Bulto.findByOrdenDeTransporte", query = "SELECT b FROM Bulto b WHERE b.ordenDeTransporte = :ordenDeTransporte"),
    @NamedQuery(name = "Bulto.findByIdBulto", query = "SELECT b FROM Bulto b WHERE b.bultoPK.idBulto = :idBulto"),
    @NamedQuery(name = "Bulto.findByDespachoIddespacho", query = "SELECT b FROM Bulto b WHERE b.bultoPK.despachoIddespacho = :despachoIddespacho")})
public class Bulto implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected BultoPK bultoPK;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "ordenDeTransporte")
    private String ordenDeTransporte;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Column(name = "etiqueta")
    private byte[] etiqueta;
    @JoinColumn(name = "despacho_iddespacho", referencedColumnName = "iddespacho", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Despacho despacho;

    public Bulto() {
    }

    public Bulto(BultoPK bultoPK) {
        this.bultoPK = bultoPK;
    }

    public Bulto(BultoPK bultoPK, String ordenDeTransporte, byte[] etiqueta) {
        this.bultoPK = bultoPK;
        this.ordenDeTransporte = ordenDeTransporte;
        this.etiqueta = etiqueta;
    }

    public Bulto(int idBulto, int despachoIddespacho) {
        this.bultoPK = new BultoPK(idBulto, despachoIddespacho);
    }

    public BultoPK getBultoPK() {
        return bultoPK;
    }

    public void setBultoPK(BultoPK bultoPK) {
        this.bultoPK = bultoPK;
    }

    public String getOrdenDeTransporte() {
        return ordenDeTransporte;
    }

    public void setOrdenDeTransporte(String ordenDeTransporte) {
        this.ordenDeTransporte = ordenDeTransporte;
    }

    public byte[] getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(byte[] etiqueta) {
        this.etiqueta = etiqueta;
    }

    public Despacho getDespacho() {
        return despacho;
    }

    public void setDespacho(Despacho despacho) {
        this.despacho = despacho;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bultoPK != null ? bultoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bulto)) {
            return false;
        }
        Bulto other = (Bulto) object;
        if ((this.bultoPK == null && other.bultoPK != null) || (this.bultoPK != null && !this.bultoPK.equals(other.bultoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.Bulto[ bultoPK=" + bultoPK + " ]";
    }
    
}
