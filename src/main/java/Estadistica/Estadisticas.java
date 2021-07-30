/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Estadistica;

import Clases.Producto;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author pc
 */
public class Estadisticas {
   
    public static List<ProductoVenta> MasVendidos()
    {
        List<ProductoVenta> masVendidos= new ArrayList();
         try{
            /* TODO output your page here. You may use following sample code. */
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            Query q1 = em.createNativeQuery("SELECT producto.idproducto, IFNULL(COUNT(detalle_venta.cantidad), 0)'cantidad' FROM producto left JOIN detalle_venta on producto.idproducto = detalle_venta.producto_idproducto group by idproducto order by cantidad Desc;");
            List lista = q1.getResultList();
            List<ProductoVenta> MasVendidos = new ArrayList();
            for (int i = 0; i < lista.size(); i++) {
                Object[] o = (Object[]) lista.get(i);
                Integer id = (Integer) o[0];
                long cantidad = (long) o[1];
                ProductoVenta pro = new ProductoVenta();
                pro.setProducto(em.find(Producto.class, id));
                pro.setCantidadVendidos((int) cantidad);
                MasVendidos.add(pro);
                
            }
            masVendidos = MasVendidos;
        }
        catch(Exception e)
        {
            e.getMessage();
        }
         return masVendidos;
    }
    public static List<Producto> MasVendidosBanner()
    {
        List<Producto> masVendidos= new ArrayList();
         try{
            /* TODO output your page here. You may use following sample code. */
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            Query q1 = em.createNativeQuery("SELECT producto.idproducto, IFNULL(COUNT(detalle_venta.cantidad), 0)'cantidad' FROM producto left JOIN detalle_venta on producto.idproducto = detalle_venta.producto_idproducto group by idproducto order by cantidad Desc;");
            List lista = q1.getResultList();
            List<ProductoVenta> MasVendidos = new ArrayList();
            for (int i = 0; i < lista.size(); i++) {
                Object[] o = (Object[]) lista.get(i);
                Integer id = (Integer) o[0];
                long cantidad = (long) o[1];
                ProductoVenta pro = new ProductoVenta();
                pro.setProducto(em.find(Producto.class, id));
                pro.setCantidadVendidos((int) cantidad);
                if(pro.getProducto().getDisponible()==Short.parseShort("1"))
                {
                    MasVendidos.add(pro);
                }
            }
            if(lista.size()<6)
            {
                for (int i = 0; i < lista.size(); i++) {
                 masVendidos.add(MasVendidos.get(i).getProducto());
                }
            }else{
                for (int i = 0; i < 7; i++) {
                 masVendidos.add(MasVendidos.get(i).getProducto());
             }
            }
             
        }
        catch(Exception e)
        {
            e.getMessage();
        }
         return masVendidos;
    }
    public static List<Producto> ProductosSimilares(Producto pros)
    {
        List<Producto> masVendidos= new ArrayList();
         try{
            /* TODO output your page here. You may use following sample code. */
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            Query q1 = em.createNativeQuery("SELECT producto.idproducto, IFNULL(COUNT(detalle_venta.cantidad), 0)'cantidad' FROM producto left JOIN detalle_venta on producto.idproducto = detalle_venta.producto_idproducto group by idproducto order by cantidad Desc;");
            List lista = q1.getResultList();
            List<ProductoVenta> MasVendidos = new ArrayList();
            for (int i = 0; i < lista.size(); i++) {
                Object[] o = (Object[]) lista.get(i);
                Integer id = (Integer) o[0];
                long cantidad = (long) o[1];
                ProductoVenta pro = new ProductoVenta();
                pro.setProducto(em.find(Producto.class, id));
                pro.setCantidadVendidos((int) cantidad);
                 if(pro.getProducto().getDisponible()==Short.parseShort("1"))
                {
                    MasVendidos.add(pro);
                }
            }
             if(lista.size()<6)
            {
                for (int i = 0; i < lista.size(); i++) {
                    if(MasVendidos.get(i).getProducto().getFamiliaProductoIdfamiliaProducto().getIdfamiliaProducto()==pros.getFamiliaProductoIdfamiliaProducto().getIdfamiliaProducto())
                    {
                        masVendidos.add(MasVendidos.get(i).getProducto());
                    }
                }
                
            }else{
                    for (int i = 0; i < 7; i++) 
                    { 
                        if(MasVendidos.get(i).getProducto().getFamiliaProductoIdfamiliaProducto()==pros.getFamiliaProductoIdfamiliaProducto())
                        {
                            masVendidos.add(MasVendidos.get(i).getProducto());
                        }
                    }
            }
        }
        catch(Exception e)
        {
            e.getMessage();
        }
        if(masVendidos.size()>7)
        {
            masVendidos= masVendidos.subList(0, 6);
        }
        return masVendidos;
    }
    public static List<ProductoVenta> MasVendidosPorFecha(String inicio, String ultimo)
    {
        List<ProductoVenta> masVendidos= new ArrayList();
         try{
            /* TODO output your page here. You may use following sample code. */
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            String query="SELECT producto.idproducto, IFNULL(COUNT(detalle_venta.cantidad), 0)'cantidad' FROM producto left JOIN detalle_venta on producto.idproducto = detalle_venta.producto_idproducto LEFT JOIN Venta on detalle_venta.venta_idventa = venta.idventa WHERE venta.fecha BETWEEN CAST('"+inicio+"' AS DATE) AND CAST('"+ultimo+"' AS DATE) group by idproducto order by cantidad DESC;";
            Query q1 = em.createNativeQuery(query);
            List lista = q1.getResultList();
            List<ProductoVenta> MasVendidos = new ArrayList();
            for (int i = 0; i < lista.size(); i++) {
                Object[] o = (Object[]) lista.get(i);
                Integer id = (Integer) o[0];
                long cantidad = (long) o[1];
                ProductoVenta pro = new ProductoVenta();
                pro.setProducto(em.find(Producto.class, id));
                pro.setCantidadVendidos((int) cantidad);
                MasVendidos.add(pro);
            }
            masVendidos = MasVendidos;
        }
        catch(Exception e)
        {
            e.getMessage();
        }
         return masVendidos;
    }
     public static List<ProductoVenta> MasVendidosPorCategoria(String categoria)
    {
        List<ProductoVenta> masVendidos= new ArrayList();
         try{
            /* TODO output your page here. You may use following sample code. */
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            String query="SELECT producto.idproducto, IFNULL(COUNT(detalle_venta.cantidad), 0)'cantidad' FROM producto left JOIN detalle_venta on producto.idproducto = detalle_venta.producto_idproducto left JOIN familia_producto on producto.familia_producto_idfamilia_producto =familia_producto.idfamilia_producto where familia_producto.nombre = '"+categoria+"' group by idproducto order by cantidad DESC;";
            Query q1 = em.createNativeQuery(query);
            List lista = q1.getResultList();
            List<ProductoVenta> MasVendidos = new ArrayList();
            for (int i = 0; i < lista.size(); i++) {
                Object[] o = (Object[]) lista.get(i);
                Integer id = (Integer) o[0];
                long cantidad = (long) o[1];
                ProductoVenta pro = new ProductoVenta();
                pro.setProducto(em.find(Producto.class, id));
                pro.setCantidadVendidos((int) cantidad);
                MasVendidos.add(pro);
            }
            masVendidos = MasVendidos;
        }
        catch(Exception e)
        {
            e.getMessage();
        }
         return masVendidos;
    }
    
    
     public static List<ProductoVenta> MenosVendidos()
    {
        List<ProductoVenta> menosVendidos= new ArrayList();
         try{
            /* TODO output your page here. You may use following sample code. */
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            Query q1 = em.createNativeQuery("SELECT producto.idproducto, IFNULL(COUNT(detalle_venta.cantidad), 0)'cantidad' FROM producto left JOIN detalle_venta on producto.idproducto = detalle_venta.producto_idproducto group by idproducto order by cantidad ASC;");
            List lista = q1.getResultList();
            List<ProductoVenta> Menos = new ArrayList();
            for (int i = 0; i < lista.size(); i++) {
                Object[] o = (Object[]) lista.get(i);
                Integer id = (Integer) o[0];
                long cantidad = (long) o[1];
                ProductoVenta pro = new ProductoVenta();
                pro.setProducto(em.find(Producto.class, id));
                pro.setCantidadVendidos((int) cantidad);
                Menos.add(pro);
            }
            menosVendidos = Menos;
        }
        catch(Exception e)
        {
            e.getMessage();
        }
         return menosVendidos;
    }
     
    public static List<ProductoVenta> MenosVendidosPorFecha(String inicio, String ultimo)
    {
        List<ProductoVenta> masVendidos= new ArrayList();
         try{
            /* TODO output your page here. You may use following sample code. */
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            String query="SELECT producto.idproducto, IFNULL(COUNT(detalle_venta.cantidad), 0)'cantidad' FROM producto left JOIN detalle_venta on producto.idproducto = detalle_venta.producto_idproducto LEFT JOIN Venta on detalle_venta.venta_idventa = venta.idventa WHERE venta.fecha BETWEEN CAST('"+inicio+"' AS DATE) AND CAST('"+ultimo+"' AS DATE) group by idproducto order by cantidad ASC;";
            Query q1 = em.createNativeQuery(query);
            List lista = q1.getResultList();
            List<ProductoVenta> MasVendidos = new ArrayList();
            for (int i = 0; i < lista.size(); i++) {
                Object[] o = (Object[]) lista.get(i);
                Integer id = (Integer) o[0];
                long cantidad = (long) o[1];
                ProductoVenta pro = new ProductoVenta();
                pro.setProducto(em.find(Producto.class, id));
                pro.setCantidadVendidos((int) cantidad);
                MasVendidos.add(pro);
            }
            masVendidos = MasVendidos;
        }
        catch(Exception e)
        {
            e.getMessage();
        }
         return masVendidos;
    }
     public static List<ProductoVenta> MenosVendidosPorCategoria(String categoria)
    {
        List<ProductoVenta> masVendidos= new ArrayList();
         try{
            /* TODO output your page here. You may use following sample code. */
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            String query="SELECT producto.idproducto, IFNULL(COUNT(detalle_venta.cantidad), 0)'cantidad' FROM producto left JOIN detalle_venta on producto.idproducto = detalle_venta.producto_idproducto left JOIN familia_producto on producto.familia_producto_idfamilia_producto =familia_producto.idfamilia_producto where familia_producto.nombre = '"+categoria+"' group by idproducto order by cantidad ASC;";
            Query q1 = em.createNativeQuery(query);
            List lista = q1.getResultList();
            List<ProductoVenta> MasVendidos = new ArrayList();
            for (int i = 0; i < lista.size(); i++) {
                Object[] o = (Object[]) lista.get(i);
                Integer id = (Integer) o[0];
                long cantidad = (long) o[1];
                ProductoVenta pro = new ProductoVenta();
                pro.setProducto(em.find(Producto.class, id));
                pro.setCantidadVendidos((int) cantidad);
                MasVendidos.add(pro);
            }
            masVendidos = MasVendidos;
        }
        catch(Exception e)
        {
            e.getMessage();
        }
         return masVendidos;
    } 
    
}
