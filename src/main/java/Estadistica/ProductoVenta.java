/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Estadistica;

import Clases.Producto;

/**
 *
 * @author pc
 */
public class ProductoVenta {
    private Producto producto;
    private int cantidadVendidos;

    public ProductoVenta() {
        this.producto = new Producto();
        this.cantidadVendidos = 0;
    }
    public ProductoVenta(Producto producto, int cantidadVendidos) {
        this.producto = producto;
        this.cantidadVendidos = cantidadVendidos;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getCantidadVendidos() {
        return cantidadVendidos;
    }

    public void setCantidadVendidos(int cantidadVendidos) {
        this.cantidadVendidos = cantidadVendidos;
    }
    
}
