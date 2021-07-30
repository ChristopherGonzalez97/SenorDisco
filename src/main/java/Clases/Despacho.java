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
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
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
@Table(name = "despacho")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Despacho.findAll", query = "SELECT d FROM Despacho d"),
    @NamedQuery(name = "Despacho.findByIddespacho", query = "SELECT d FROM Despacho d WHERE d.iddespacho = :iddespacho"),
    @NamedQuery(name = "Despacho.findByValor", query = "SELECT d FROM Despacho d WHERE d.valor = :valor"),
    @NamedQuery(name = "Despacho.findByTipo", query = "SELECT d FROM Despacho d WHERE d.tipo = :tipo"),
    @NamedQuery(name = "Despacho.findByCodigoDespacho", query = "SELECT d FROM Despacho d WHERE d.codigoDespacho = :codigoDespacho"),
    @NamedQuery(name = "Despacho.findByDireccion", query = "SELECT d FROM Despacho d WHERE d.direccion = :direccion"),
    @NamedQuery(name = "Despacho.findByCompa\u00f1ia", query = "SELECT d FROM Despacho d WHERE d.compa\u00f1ia = :compa\u00f1ia")})
public class Despacho implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "iddespacho")
    private Integer iddespacho;
    @Basic(optional = false)
    @NotNull
    @Column(name = "valor")
    private int valor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "tipo")
    private String tipo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "codigoDespacho")
    private int codigoDespacho;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 400)
    @Column(name = "direccion")
    private String direccion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "compa\u00f1ia")
    private String compañia;
    @JoinColumn(name = "destinatario_idDestinatario", referencedColumnName = "idDestinatario")
    @ManyToOne(optional = false)
    private Destinatario destinatarioidDestinatario;
    @JoinColumns({
        @JoinColumn(name = "venta_idventa", referencedColumnName = "idventa"),
        @JoinColumn(name = "venta_usuario_idusuario", referencedColumnName = "usuario_idusuario")})
    @ManyToOne(optional = false)
    private Venta venta;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "despacho")
    private List<Bulto> bultoList;

    public Despacho() {
    }

    public Despacho(Integer iddespacho) {
        this.iddespacho = iddespacho;
    }

    public Despacho(Integer iddespacho, int valor, String tipo, int codigoDespacho, String direccion, String compañia) {
        this.iddespacho = iddespacho;
        this.valor = valor;
        this.tipo = tipo;
        this.codigoDespacho = codigoDespacho;
        this.direccion = direccion;
        this.compañia = compañia;
    }

    public Integer getIddespacho() {
        return iddespacho;
    }

    public void setIddespacho(Integer iddespacho) {
        this.iddespacho = iddespacho;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getCodigoDespacho() {
        return codigoDespacho;
    }

    public void setCodigoDespacho(int codigoDespacho) {
        this.codigoDespacho = codigoDespacho;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCompañia() {
        return compañia;
    }

    public void setCompañia(String compañia) {
        this.compañia = compañia;
    }

    public Destinatario getDestinatarioidDestinatario() {
        return destinatarioidDestinatario;
    }

    public void setDestinatarioidDestinatario(Destinatario destinatarioidDestinatario) {
        this.destinatarioidDestinatario = destinatarioidDestinatario;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    @XmlTransient
    public List<Bulto> getBultoList() {
        return bultoList;
    }

    public void setBultoList(List<Bulto> bultoList) {
        this.bultoList = bultoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddespacho != null ? iddespacho.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Despacho)) {
            return false;
        }
        Despacho other = (Despacho) object;
        if ((this.iddespacho == null && other.iddespacho != null) || (this.iddespacho != null && !this.iddespacho.equals(other.iddespacho))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.Despacho[ iddespacho=" + iddespacho + " ]";
    }
    
}
