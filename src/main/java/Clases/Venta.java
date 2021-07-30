/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author pc
 */
@Entity
@Table(name = "venta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Venta.findAll", query = "SELECT v FROM Venta v"),
    @NamedQuery(name = "Venta.findByIdventa", query = "SELECT v FROM Venta v WHERE v.ventaPK.idventa = :idventa"),
    @NamedQuery(name = "Venta.findByFecha", query = "SELECT v FROM Venta v WHERE v.fecha = :fecha"),
    @NamedQuery(name = "Venta.findByEstado", query = "SELECT v FROM Venta v WHERE v.estado = :estado"),
     @NamedQuery(name = "Venta.findByFechaBetwen", query = "SELECT v FROM Venta v WHERE v.fecha BETWEEN CAST(:fechaInicio AS DATE) AND CAST(:fechaFinal AS DATE)"),
    @NamedQuery(name = "Venta.findByFechaDia", query = "SELECT v FROM Venta v WHERE v.fecha = CAST(:fecha AS DATE)")
,
    @NamedQuery(name = "Venta.findByUsuarioIdusuario", query = "SELECT v FROM Venta v WHERE v.ventaPK.usuarioIdusuario = :usuarioIdusuario")})
public class Venta implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected VentaPK ventaPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "estado")
    private String estado;
    @Lob
    @Column(name = "boletaGenerada")
    private byte[] boletaGenerada;
    @Lob
    @Column(name = "boletaLegal")
    private byte[] boletaLegal;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "venta")
    private List<DocumentoTributario> documentoTributarioList;
    @JoinColumn(name = "usuario_idusuario", referencedColumnName = "idusuario", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Usuario usuario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "venta")
    private List<Despacho> despachoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "venta")
    private List<DetalleVenta> detalleVentaList;

    public Venta() {
    }

    public Venta(VentaPK ventaPK) {
        this.ventaPK = ventaPK;
    }
    public boolean fechaLimite()
    {
        boolean fechaLimite=false;
        Calendar fechaCompra = new GregorianCalendar();
        fechaCompra.setTime(this.getFecha());
        Calendar fechaLimites = new GregorianCalendar();
        fechaLimites.setTime(this.getFecha());
        fechaLimites.add(Calendar.DATE,30);
        Calendar actual = Calendar.getInstance();
        if(fechaLimites.compareTo(actual)>0)
        {
            fechaLimite=true;
        }
        
        return fechaLimite;
    }


    public Venta(VentaPK ventaPK, Date fecha, String estado) {
        this.ventaPK = ventaPK;
        this.fecha = fecha;
        this.estado = estado;
    }

    public Venta(int idventa, int usuarioIdusuario) {
        this.ventaPK = new VentaPK(idventa, usuarioIdusuario);
    }

    public VentaPK getVentaPK() {
        return ventaPK;
    }

    public void setVentaPK(VentaPK ventaPK) {
        this.ventaPK = ventaPK;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public byte[] getBoletaGenerada() {
        return boletaGenerada;
    }

    public void setBoletaGenerada(byte[] boletaGenerada) {
        this.boletaGenerada = boletaGenerada;
    }

    public byte[] getBoletaLegal() {
        return boletaLegal;
    }

    public void setBoletaLegal(byte[] boletaLegal) {
        this.boletaLegal = boletaLegal;
    }

    @XmlTransient
    public List<DocumentoTributario> getDocumentoTributarioList() {
        return documentoTributarioList;
    }

    public void setDocumentoTributarioList(List<DocumentoTributario> documentoTributarioList) {
        this.documentoTributarioList = documentoTributarioList;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @XmlTransient
    public List<Despacho> getDespachoList() {
        return despachoList;
    }

    public void setDespachoList(List<Despacho> despachoList) {
        this.despachoList = despachoList;
    }

    @XmlTransient
    public List<DetalleVenta> getDetalleVentaList() {
        return detalleVentaList;
    }

    public void setDetalleVentaList(List<DetalleVenta> detalleVentaList) {
        this.detalleVentaList = detalleVentaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ventaPK != null ? ventaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Venta)) {
            return false;
        }
        Venta other = (Venta) object;
        if ((this.ventaPK == null && other.ventaPK != null) || (this.ventaPK != null && !this.ventaPK.equals(other.ventaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.Venta[ ventaPK=" + ventaPK + " ]";
    }
    
}
