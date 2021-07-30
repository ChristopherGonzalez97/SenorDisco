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
public class DocumentoTributarioPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "iddocumento_tributario")
    private int iddocumentoTributario;
    @Basic(optional = false)
    @NotNull
    @Column(name = "venta_idventa")
    private int ventaIdventa;
    @Basic(optional = false)
    @NotNull
    @Column(name = "venta_usuario_idusuario")
    private int ventaUsuarioIdusuario;

    public DocumentoTributarioPK() {
    }

    public DocumentoTributarioPK(int iddocumentoTributario, int ventaIdventa, int ventaUsuarioIdusuario) {
        this.iddocumentoTributario = iddocumentoTributario;
        this.ventaIdventa = ventaIdventa;
        this.ventaUsuarioIdusuario = ventaUsuarioIdusuario;
    }

    public int getIddocumentoTributario() {
        return iddocumentoTributario;
    }

    public void setIddocumentoTributario(int iddocumentoTributario) {
        this.iddocumentoTributario = iddocumentoTributario;
    }

    public int getVentaIdventa() {
        return ventaIdventa;
    }

    public void setVentaIdventa(int ventaIdventa) {
        this.ventaIdventa = ventaIdventa;
    }

    public int getVentaUsuarioIdusuario() {
        return ventaUsuarioIdusuario;
    }

    public void setVentaUsuarioIdusuario(int ventaUsuarioIdusuario) {
        this.ventaUsuarioIdusuario = ventaUsuarioIdusuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) iddocumentoTributario;
        hash += (int) ventaIdventa;
        hash += (int) ventaUsuarioIdusuario;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DocumentoTributarioPK)) {
            return false;
        }
        DocumentoTributarioPK other = (DocumentoTributarioPK) object;
        if (this.iddocumentoTributario != other.iddocumentoTributario) {
            return false;
        }
        if (this.ventaIdventa != other.ventaIdventa) {
            return false;
        }
        if (this.ventaUsuarioIdusuario != other.ventaUsuarioIdusuario) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.DocumentoTributarioPK[ iddocumentoTributario=" + iddocumentoTributario + ", ventaIdventa=" + ventaIdventa + ", ventaUsuarioIdusuario=" + ventaUsuarioIdusuario + " ]";
    }
    
}
