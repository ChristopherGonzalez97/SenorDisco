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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author pc
 */
@Entity
@Table(name = "boleta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Boleta.findAll", query = "SELECT b FROM Boleta b"),
    @NamedQuery(name = "Boleta.findByMontoFinal", query = "SELECT b FROM Boleta b WHERE b.montoFinal = :montoFinal"),
    @NamedQuery(name = "Boleta.findByDocumentoTributarioIddocumentoTributario", query = "SELECT b FROM Boleta b WHERE b.boletaPK.documentoTributarioIddocumentoTributario = :documentoTributarioIddocumentoTributario"),
    @NamedQuery(name = "Boleta.findByDocumentoTributarioVentaIdventa", query = "SELECT b FROM Boleta b WHERE b.boletaPK.documentoTributarioVentaIdventa = :documentoTributarioVentaIdventa"),
    @NamedQuery(name = "Boleta.findByDocumentoTributarioVentaUsuarioIdusuario", query = "SELECT b FROM Boleta b WHERE b.boletaPK.documentoTributarioVentaUsuarioIdusuario = :documentoTributarioVentaUsuarioIdusuario")})
public class Boleta implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected BoletaPK boletaPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "monto_final")
    private int montoFinal;
    @JoinColumns({
        @JoinColumn(name = "documento_tributario_iddocumento_tributario", referencedColumnName = "iddocumento_tributario", insertable = false, updatable = false),
        @JoinColumn(name = "documento_tributario_venta_idventa", referencedColumnName = "venta_idventa", insertable = false, updatable = false),
        @JoinColumn(name = "documento_tributario_venta_usuario_idusuario", referencedColumnName = "venta_usuario_idusuario", insertable = false, updatable = false)})
    @OneToOne(optional = false)
    private DocumentoTributario documentoTributario;

    public Boleta() {
    }

    public Boleta(BoletaPK boletaPK) {
        this.boletaPK = boletaPK;
    }

    public Boleta(BoletaPK boletaPK, int montoFinal) {
        this.boletaPK = boletaPK;
        this.montoFinal = montoFinal;
    }

    public Boleta(int documentoTributarioIddocumentoTributario, int documentoTributarioVentaIdventa, int documentoTributarioVentaUsuarioIdusuario) {
        this.boletaPK = new BoletaPK(documentoTributarioIddocumentoTributario, documentoTributarioVentaIdventa, documentoTributarioVentaUsuarioIdusuario);
    }

    public BoletaPK getBoletaPK() {
        return boletaPK;
    }

    public void setBoletaPK(BoletaPK boletaPK) {
        this.boletaPK = boletaPK;
    }

    public int getMontoFinal() {
        return montoFinal;
    }

    public void setMontoFinal(int montoFinal) {
        this.montoFinal = montoFinal;
    }

    public DocumentoTributario getDocumentoTributario() {
        return documentoTributario;
    }

    public void setDocumentoTributario(DocumentoTributario documentoTributario) {
        this.documentoTributario = documentoTributario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (boletaPK != null ? boletaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Boleta)) {
            return false;
        }
        Boleta other = (Boleta) object;
        if ((this.boletaPK == null && other.boletaPK != null) || (this.boletaPK != null && !this.boletaPK.equals(other.boletaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.Boleta[ boletaPK=" + boletaPK + " ]";
    }
    
}
