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
@Table(name = "factura")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Factura.findAll", query = "SELECT f FROM Factura f"),
    @NamedQuery(name = "Factura.findByMontoBruto", query = "SELECT f FROM Factura f WHERE f.montoBruto = :montoBruto"),
    @NamedQuery(name = "Factura.findByMontoFinal", query = "SELECT f FROM Factura f WHERE f.montoFinal = :montoFinal"),
    @NamedQuery(name = "Factura.findByDocumentoTributarioIddocumentoTributario", query = "SELECT f FROM Factura f WHERE f.facturaPK.documentoTributarioIddocumentoTributario = :documentoTributarioIddocumentoTributario"),
    @NamedQuery(name = "Factura.findByDocumentoTributarioVentaIdventa", query = "SELECT f FROM Factura f WHERE f.facturaPK.documentoTributarioVentaIdventa = :documentoTributarioVentaIdventa"),
    @NamedQuery(name = "Factura.findByDocumentoTributarioVentaUsuarioIdusuario", query = "SELECT f FROM Factura f WHERE f.facturaPK.documentoTributarioVentaUsuarioIdusuario = :documentoTributarioVentaUsuarioIdusuario")})
public class Factura implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected FacturaPK facturaPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "monto_bruto")
    private int montoBruto;
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

    public Factura() {
    }

    public Factura(FacturaPK facturaPK) {
        this.facturaPK = facturaPK;
    }

    public Factura(FacturaPK facturaPK, int montoBruto, int montoFinal) {
        this.facturaPK = facturaPK;
        this.montoBruto = montoBruto;
        this.montoFinal = montoFinal;
    }

    public Factura(int documentoTributarioIddocumentoTributario, int documentoTributarioVentaIdventa, int documentoTributarioVentaUsuarioIdusuario) {
        this.facturaPK = new FacturaPK(documentoTributarioIddocumentoTributario, documentoTributarioVentaIdventa, documentoTributarioVentaUsuarioIdusuario);
    }

    public FacturaPK getFacturaPK() {
        return facturaPK;
    }

    public void setFacturaPK(FacturaPK facturaPK) {
        this.facturaPK = facturaPK;
    }

    public int getMontoBruto() {
        return montoBruto;
    }

    public void setMontoBruto(int montoBruto) {
        this.montoBruto = montoBruto;
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
        hash += (facturaPK != null ? facturaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Factura)) {
            return false;
        }
        Factura other = (Factura) object;
        if ((this.facturaPK == null && other.facturaPK != null) || (this.facturaPK != null && !this.facturaPK.equals(other.facturaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.Factura[ facturaPK=" + facturaPK + " ]";
    }
    
}
