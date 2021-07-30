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
@Table(name = "producto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Producto.findAll", query = "SELECT p FROM Producto p"),
    @NamedQuery(name = "Producto.findByIdproducto", query = "SELECT p FROM Producto p WHERE p.idproducto = :idproducto"),
    @NamedQuery(name = "Producto.findByNombre", query = "SELECT p FROM Producto p WHERE p.nombre = :nombre"),
    @NamedQuery(name = "Producto.findByDescripcion", query = "SELECT p FROM Producto p WHERE p.descripcion = :descripcion"),
    @NamedQuery(name = "Producto.findByPrecioVenta", query = "SELECT p FROM Producto p WHERE p.precioVenta = :precioVenta"),
    @NamedQuery(name = "Producto.findByPrecioCompra", query = "SELECT p FROM Producto p WHERE p.precioCompra = :precioCompra"),
    @NamedQuery(name = "Producto.findByPrecioVendedor", query = "SELECT p FROM Producto p WHERE p.precioVendedor = :precioVendedor"),
    @NamedQuery(name = "Producto.findByPrecioDistribuidor", query = "SELECT p FROM Producto p WHERE p.precioDistribuidor = :precioDistribuidor"),
    @NamedQuery(name = "Producto.findByStock", query = "SELECT p FROM Producto p WHERE p.stock = :stock"),
    @NamedQuery(name = "Producto.findByStockCritico", query = "SELECT p FROM Producto p WHERE p.stockCritico = :stockCritico"),
    @NamedQuery(name = "Producto.findByDisponible", query = "SELECT p FROM Producto p WHERE p.disponible = :disponible"),
    @NamedQuery(name = "Producto.findByDiametro", query = "SELECT p FROM Producto p WHERE p.diametro = :diametro"),
    @NamedQuery(name = "Producto.findByPeso", query = "SELECT p FROM Producto p WHERE p.peso = :peso"),
    @NamedQuery(name = "Producto.findByLargo", query = "SELECT p FROM Producto p WHERE p.largo = :largo"),
    @NamedQuery(name = "Producto.findByAncho", query = "SELECT p FROM Producto p WHERE p.ancho = :ancho"),
    @NamedQuery(name = "Producto.findByAltura", query = "SELECT p FROM Producto p WHERE p.altura = :altura"),
    @NamedQuery(name = "Producto.findByTalla", query = "SELECT p FROM Producto p WHERE p.talla = :talla"),
    @NamedQuery(name = "Producto.findByVideo", query = "SELECT p FROM Producto p WHERE p.video = :video"),
    @NamedQuery(name = "Producto.findByAltoProducto", query = "SELECT p FROM Producto p WHERE p.altoProducto = :altoProducto"),
    @NamedQuery(name = "Producto.findByLargoProducto", query = "SELECT p FROM Producto p WHERE p.largoProducto = :largoProducto"),
    @NamedQuery(name = "Producto.findByAnchoProducto", query = "SELECT p FROM Producto p WHERE p.anchoProducto = :anchoProducto"),
 @NamedQuery(name = "Producto.OrderByMayorPrecio", query= "SELECT p FROM Producto p Order by p.precioVenta DESC"),
    @NamedQuery(name = "Producto.OrderByMenorPrecio", query= "SELECT p FROM Producto p Order by p.precioVenta ASC"),
    @NamedQuery(name = "Producto.OrderByNombre", query= "SELECT p FROM Producto p Order by p.nombre ASC"),
    @NamedQuery(name = "Producto.OrderStock", query= "SELECT p FROM Producto p WHERE p.stock>0"),})
public class Producto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idproducto")
    private Integer idproducto;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "precio_venta")
    private int precioVenta;
    @Basic(optional = false)
    @NotNull
    @Column(name = "precio_compra")
    private int precioCompra;
    @Basic(optional = false)
    @NotNull
    @Column(name = "precio_vendedor")
    private int precioVendedor;
    @Basic(optional = false)
    @NotNull
    @Column(name = "precioDistribuidor")
    private int precioDistribuidor;
    @Basic(optional = false)
    @NotNull
    @Column(name = "stock")
    private int stock;
    @Basic(optional = false)
    @NotNull
    @Column(name = "stock_critico")
    private int stockCritico;
    @Basic(optional = false)
    @NotNull
    @Column(name = "disponible")
    private short disponible;
    @Basic(optional = false)
    @NotNull
    @Column(name = "diametro")
    private int diametro;
    @Basic(optional = false)
    @NotNull
    @Column(name = "peso")
    private double peso;
    @Basic(optional = false)
    @NotNull
    @Column(name = "largo")
    private int largo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ancho")
    private int ancho;
    @Basic(optional = false)
    @NotNull
    @Column(name = "altura")
    private int altura;
    @Size(max = 45)
    @Column(name = "talla")
    private String talla;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "video")
    private String video;
    @Basic(optional = false)
    @NotNull
    @Column(name = "alto_producto")
    private int altoProducto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "largo_producto")
    private int largoProducto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ancho_producto")
    private int anchoProducto;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "producto")
    private List<Imagen> imagenList;
    @JoinColumn(name = "fabricante_rut", referencedColumnName = "rut")
    @ManyToOne(optional = false)
    private Fabricante fabricanteRut;
    @JoinColumn(name = "familia_producto_idfamilia_producto", referencedColumnName = "idfamilia_producto")
    @ManyToOne(optional = false)
    private FamiliaProducto familiaProductoIdfamiliaProducto;
    @JoinColumn(name = "grupo_idgrupo", referencedColumnName = "idgrupo")
    @ManyToOne
    private Grupo grupoIdgrupo;
    @JoinColumn(name = "marca_idMarca", referencedColumnName = "idMarca")
    @ManyToOne(optional = false)
    private Marca marcaidMarca;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "producto")
    private List<DetalleVenta> detalleVentaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "producto")
    private List<DetallePedido> detallePedidoList;

    public Producto() {
    }

    public Producto(Integer idproducto) {
        this.idproducto = idproducto;
    }

    public Producto(Integer idproducto, String nombre, String descripcion, int precioVenta, int precioCompra, int precioVendedor, int precioDistribuidor, int stock, int stockCritico, short disponible, int diametro, double peso, int largo, int ancho, int altura, String video, int altoProducto, int largoProducto, int anchoProducto) {
        this.idproducto = idproducto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precioVenta = precioVenta;
        this.precioCompra = precioCompra;
        this.precioVendedor = precioVendedor;
        this.precioDistribuidor = precioDistribuidor;
        this.stock = stock;
        this.stockCritico = stockCritico;
        this.disponible = disponible;
        this.diametro = diametro;
        this.peso = peso;
        this.largo = largo;
        this.ancho = ancho;
        this.altura = altura;
        this.video = video;
        this.altoProducto = altoProducto;
        this.largoProducto = largoProducto;
        this.anchoProducto = anchoProducto;
    }

    public Integer getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(Integer idproducto) {
        this.idproducto = idproducto;
    }

    public String getNombre() {
        return nombre;
    }
    public int getPrecioBruto()
    {
        return (int) (this.getPrecioVenta() * 0.81);
    }
    public int getIva()
    {
        return (int) (this.getPrecioVenta() * 0.19);
    }
public int StockStatus()
    {
        int status =0;
        int prom =(int) (this.getStock() * 1.5);
        if( this.getStock()< this.getStockCritico())
        {
            status=-1;
        }
        else if(this.getStock()> this.getStockCritico() && this.getStock()<prom )
        {
            status=0;
        }
        else if(this.getStock()>prom)
        {
            status=1;
        }
         return status;   
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(int precioVenta) {
        this.precioVenta = precioVenta;
    }

    public int getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(int precioCompra) {
        this.precioCompra = precioCompra;
    }

    public int getPrecioVendedor() {
        return precioVendedor;
    }

    public void setPrecioVendedor(int precioVendedor) {
        this.precioVendedor = precioVendedor;
    }

    public int getPrecioDistribuidor() {
        return precioDistribuidor;
    }

    public void setPrecioDistribuidor(int precioDistribuidor) {
        this.precioDistribuidor = precioDistribuidor;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getStockCritico() {
        return stockCritico;
    }

    public void setStockCritico(int stockCritico) {
        this.stockCritico = stockCritico;
    }

    public short getDisponible() {
        return disponible;
    }

    public void setDisponible(short disponible) {
        this.disponible = disponible;
    }

    public int getDiametro() {
        return diametro;
    }

    public void setDiametro(int diametro) {
        this.diametro = diametro;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public int getLargo() {
        return largo;
    }

    public void setLargo(int largo) {
        this.largo = largo;
    }

    public int getAncho() {
        return ancho;
    }

    public void setAncho(int ancho) {
        this.ancho = ancho;
    }

    public int getAltura() {
        return altura;
    }

    public void setAltura(int altura) {
        this.altura = altura;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public int getAltoProducto() {
        return altoProducto;
    }

    public void setAltoProducto(int altoProducto) {
        this.altoProducto = altoProducto;
    }

    public int getLargoProducto() {
        return largoProducto;
    }

    public void setLargoProducto(int largoProducto) {
        this.largoProducto = largoProducto;
    }

    public int getAnchoProducto() {
        return anchoProducto;
    }

    public void setAnchoProducto(int anchoProducto) {
        this.anchoProducto = anchoProducto;
    }

    @XmlTransient
    public List<Imagen> getImagenList() {
        return imagenList;
    }

    public void setImagenList(List<Imagen> imagenList) {
        this.imagenList = imagenList;
    }

    public Fabricante getFabricanteRut() {
        return fabricanteRut;
    }

    public void setFabricanteRut(Fabricante fabricanteRut) {
        this.fabricanteRut = fabricanteRut;
    }

    public FamiliaProducto getFamiliaProductoIdfamiliaProducto() {
        return familiaProductoIdfamiliaProducto;
    }

    public void setFamiliaProductoIdfamiliaProducto(FamiliaProducto familiaProductoIdfamiliaProducto) {
        this.familiaProductoIdfamiliaProducto = familiaProductoIdfamiliaProducto;
    }

    public Grupo getGrupoIdgrupo() {
        return grupoIdgrupo;
    }

    public void setGrupoIdgrupo(Grupo grupoIdgrupo) {
        this.grupoIdgrupo = grupoIdgrupo;
    }

    public Marca getMarcaidMarca() {
        return marcaidMarca;
    }

    public void setMarcaidMarca(Marca marcaidMarca) {
        this.marcaidMarca = marcaidMarca;
    }

    @XmlTransient
    public List<DetalleVenta> getDetalleVentaList() {
        return detalleVentaList;
    }

    public void setDetalleVentaList(List<DetalleVenta> detalleVentaList) {
        this.detalleVentaList = detalleVentaList;
    }

    @XmlTransient
    public List<DetallePedido> getDetallePedidoList() {
        return detallePedidoList;
    }

    public void setDetallePedidoList(List<DetallePedido> detallePedidoList) {
        this.detallePedidoList = detallePedidoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idproducto != null ? idproducto.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Producto)) {
            return false;
        }
        Producto other = (Producto) object;
        if ((this.idproducto == null && other.idproducto != null) || (this.idproducto != null && !this.idproducto.equals(other.idproducto))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Clases.Producto[ idproducto=" + idproducto + " ]";
    }
    
}
