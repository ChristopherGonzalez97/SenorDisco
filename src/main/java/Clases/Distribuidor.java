/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
@Table(name = "distribuidor")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Distribuidor.findAll", query = "SELECT d FROM Distribuidor d"),
    @NamedQuery(name = "Distribuidor.findByNombre", query = "SELECT d FROM Distribuidor d WHERE d.nombre = :nombre"),
    @NamedQuery(name = "Distribuidor.findByClienteRutCliente", query = "SELECT d FROM Distribuidor d WHERE d.clienteRutCliente = :clienteRutCliente")})
public class Distribuidor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre")
    private String nombre;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "cliente_rut_cliente")
    private String clienteRutCliente;
    @JoinColumn(name = "cliente_rut_cliente", referencedColumnName = "rut_cliente", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Cliente cliente;

    public Distribuidor() {
    }

    public Distribuidor(String clienteRutCliente) {
        this.clienteRutCliente = clienteRutCliente;
    }

    public Distribuidor(String clienteRutCliente, String nombre) {
        this.clienteRutCliente = clienteRutCliente;
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getClienteRutCliente() {
        return clienteRutCliente;
    }

    public void setClienteRutCliente(String clienteRutCliente) {
        this.clienteRutCliente = clienteRutCliente;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (clienteRutCliente != null ? clienteRutCliente.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Distribuidor)) {
            return false;
        }
        Distribuidor other = (Distribuidor) object;
        if ((this.clienteRutCliente == null && other.clienteRutCliente != null) || (this.clienteRutCliente != null && !this.clienteRutCliente.equals(other.clienteRutCliente))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.Distribuidor[ clienteRutCliente=" + clienteRutCliente + " ]";
    }
    
}
