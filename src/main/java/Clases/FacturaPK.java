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
public class FacturaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "documento_tributario_iddocumento_tributario")
    private int documentoTributarioIddocumentoTributario;
    @Basic(optional = false)
    @NotNull
    @Column(name = "documento_tributario_venta_idventa")
    private int documentoTributarioVentaIdventa;
    @Basic(optional = false)
    @NotNull
    @Column(name = "documento_tributario_venta_usuario_idusuario")
    private int documentoTributarioVentaUsuarioIdusuario;

    public FacturaPK() {
    }

    public FacturaPK(int documentoTributarioIddocumentoTributario, int documentoTributarioVentaIdventa, int documentoTributarioVentaUsuarioIdusuario) {
        this.documentoTributarioIddocumentoTributario = documentoTributarioIddocumentoTributario;
        this.documentoTributarioVentaIdventa = documentoTributarioVentaIdventa;
        this.documentoTributarioVentaUsuarioIdusuario = documentoTributarioVentaUsuarioIdusuario;
    }

    public int getDocumentoTributarioIddocumentoTributario() {
        return documentoTributarioIddocumentoTributario;
    }

    public void setDocumentoTributarioIddocumentoTributario(int documentoTributarioIddocumentoTributario) {
        this.documentoTributarioIddocumentoTributario = documentoTributarioIddocumentoTributario;
    }

    public int getDocumentoTributarioVentaIdventa() {
        return documentoTributarioVentaIdventa;
    }

    public void setDocumentoTributarioVentaIdventa(int documentoTributarioVentaIdventa) {
        this.documentoTributarioVentaIdventa = documentoTributarioVentaIdventa;
    }

    public int getDocumentoTributarioVentaUsuarioIdusuario() {
        return documentoTributarioVentaUsuarioIdusuario;
    }

    public void setDocumentoTributarioVentaUsuarioIdusuario(int documentoTributarioVentaUsuarioIdusuario) {
        this.documentoTributarioVentaUsuarioIdusuario = documentoTributarioVentaUsuarioIdusuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) documentoTributarioIddocumentoTributario;
        hash += (int) documentoTributarioVentaIdventa;
        hash += (int) documentoTributarioVentaUsuarioIdusuario;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FacturaPK)) {
            return false;
        }
        FacturaPK other = (FacturaPK) object;
        if (this.documentoTributarioIddocumentoTributario != other.documentoTributarioIddocumentoTributario) {
            return false;
        }
        if (this.documentoTributarioVentaIdventa != other.documentoTributarioVentaIdventa) {
            return false;
        }
        if (this.documentoTributarioVentaUsuarioIdusuario != other.documentoTributarioVentaUsuarioIdusuario) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.FacturaPK[ documentoTributarioIddocumentoTributario=" + documentoTributarioIddocumentoTributario + ", documentoTributarioVentaIdventa=" + documentoTributarioVentaIdventa + ", documentoTributarioVentaUsuarioIdusuario=" + documentoTributarioVentaUsuarioIdusuario + " ]";
    }
    
}
