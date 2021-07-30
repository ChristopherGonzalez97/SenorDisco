/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author pc
 */
@Entity
@Table(name = "documento_tributario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DocumentoTributario.findAll", query = "SELECT d FROM DocumentoTributario d"),
    @NamedQuery(name = "DocumentoTributario.findByIddocumentoTributario", query = "SELECT d FROM DocumentoTributario d WHERE d.documentoTributarioPK.iddocumentoTributario = :iddocumentoTributario"),
    @NamedQuery(name = "DocumentoTributario.findByMetodoPago", query = "SELECT d FROM DocumentoTributario d WHERE d.metodoPago = :metodoPago"),
    @NamedQuery(name = "DocumentoTributario.findByVentaIdventa", query = "SELECT d FROM DocumentoTributario d WHERE d.documentoTributarioPK.ventaIdventa = :ventaIdventa"),
    @NamedQuery(name = "DocumentoTributario.findByVentaUsuarioIdusuario", query = "SELECT d FROM DocumentoTributario d WHERE d.documentoTributarioPK.ventaUsuarioIdusuario = :ventaUsuarioIdusuario")})
public class DocumentoTributario implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected DocumentoTributarioPK documentoTributarioPK;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "metodo_pago")
    private String metodoPago;
    @JoinColumns({
        @JoinColumn(name = "venta_idventa", referencedColumnName = "idventa", insertable = false, updatable = false),
        @JoinColumn(name = "venta_usuario_idusuario", referencedColumnName = "usuario_idusuario", insertable = false, updatable = false)})
    @ManyToOne(optional = false)
    private Venta venta;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "documentoTributario")
    private Factura factura;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "documentoTributario")
    private Boleta boleta;

    public DocumentoTributario() {
    }

    public DocumentoTributario(DocumentoTributarioPK documentoTributarioPK) {
        this.documentoTributarioPK = documentoTributarioPK;
    }

    public DocumentoTributario(DocumentoTributarioPK documentoTributarioPK, String metodoPago) {
        this.documentoTributarioPK = documentoTributarioPK;
        this.metodoPago = metodoPago;
    }

    public DocumentoTributario(int iddocumentoTributario, int ventaIdventa, int ventaUsuarioIdusuario) {
        this.documentoTributarioPK = new DocumentoTributarioPK(iddocumentoTributario, ventaIdventa, ventaUsuarioIdusuario);
    }

    public DocumentoTributarioPK getDocumentoTributarioPK() {
        return documentoTributarioPK;
    }

    public void setDocumentoTributarioPK(DocumentoTributarioPK documentoTributarioPK) {
        this.documentoTributarioPK = documentoTributarioPK;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    public Factura getFactura() {
        return factura;
    }

    public void setFactura(Factura factura) {
        this.factura = factura;
    }

    public Boleta getBoleta() {
        return boleta;
    }

    public void setBoleta(Boleta boleta) {
        this.boleta = boleta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (documentoTributarioPK != null ? documentoTributarioPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DocumentoTributario)) {
            return false;
        }
        DocumentoTributario other = (DocumentoTributario) object;
        if ((this.documentoTributarioPK == null && other.documentoTributarioPK != null) || (this.documentoTributarioPK != null && !this.documentoTributarioPK.equals(other.documentoTributarioPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.DocumentoTributario[ documentoTributarioPK=" + documentoTributarioPK + " ]";
    }
    
}
