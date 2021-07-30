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
@Table(name = "destinatario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Destinatario.findAll", query = "SELECT d FROM Destinatario d"),
    @NamedQuery(name = "Destinatario.findByRut", query = "SELECT d FROM Destinatario d WHERE d.rut = :rut"),
    @NamedQuery(name = "Destinatario.findByNombre", query = "SELECT d FROM Destinatario d WHERE d.nombre = :nombre"),
    @NamedQuery(name = "Destinatario.findByApellido", query = "SELECT d FROM Destinatario d WHERE d.apellido = :apellido"),
    @NamedQuery(name = "Destinatario.findByEmail", query = "SELECT d FROM Destinatario d WHERE d.email = :email"),
    @NamedQuery(name = "Destinatario.findByTelefono", query = "SELECT d FROM Destinatario d WHERE d.telefono = :telefono"),
    @NamedQuery(name = "Destinatario.findByIdDestinatario", query = "SELECT d FROM Destinatario d WHERE d.idDestinatario = :idDestinatario")})
public class Destinatario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "rut")
    private String rut;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "apellido")
    private String apellido;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "telefono")
    private String telefono;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idDestinatario")
    private Integer idDestinatario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "destinatarioidDestinatario")
    private List<Despacho> despachoList;

    public Destinatario() {
    }

    public Destinatario(Integer idDestinatario) {
        this.idDestinatario = idDestinatario;
    }

    public Destinatario(Integer idDestinatario, String rut, String nombre, String apellido, String email, String telefono) {
        this.idDestinatario = idDestinatario;
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.telefono = telefono;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Integer getIdDestinatario() {
        return idDestinatario;
    }

    public void setIdDestinatario(Integer idDestinatario) {
        this.idDestinatario = idDestinatario;
    }

    @XmlTransient
    public List<Despacho> getDespachoList() {
        return despachoList;
    }

    public void setDespachoList(List<Despacho> despachoList) {
        this.despachoList = despachoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDestinatario != null ? idDestinatario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Destinatario)) {
            return false;
        }
        Destinatario other = (Destinatario) object;
        if ((this.idDestinatario == null && other.idDestinatario != null) || (this.idDestinatario != null && !this.idDestinatario.equals(other.idDestinatario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.Destinatario[ idDestinatario=" + idDestinatario + " ]";
    }
    
}
