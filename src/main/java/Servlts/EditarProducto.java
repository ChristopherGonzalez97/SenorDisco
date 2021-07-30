/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Producto;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author chris
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet(name = "EditarProducto", urlPatterns = {"/EditarProducto"})
public class EditarProducto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int id= Integer.parseInt(request.getParameter("txtId"));
            String nombreProducto=request.getParameter("txtNombreProducto");
            String descripcion=request.getParameter("txtDescripcion");
            int precioVenta=Integer.parseInt(request.getParameter("txtPrecioVenta"));
            int precioVendedor=Integer.parseInt(request.getParameter("txtPrecioVendedor"));
            int precioCompra=Integer.parseInt(request.getParameter("txtPrecioCompra"));
            int stockInicial=Integer.parseInt(request.getParameter("txtStock"));
            int stockCritico=Integer.parseInt(request.getParameter("txtStockCritico"));
            int alto=Integer.parseInt(request.getParameter("txtAlto"));
            int ancho=Integer.parseInt(request.getParameter("txtAncho"));
            int largo=Integer.parseInt(request.getParameter("txtLargo"));
            int altoProducto=Integer.parseInt(request.getParameter("txtAltoProducto"));
            int anchoProducto=Integer.parseInt(request.getParameter("txtAnchoProducto"));
            int largoProducto=Integer.parseInt(request.getParameter("txtLargoProducto"));
            int precioDistribuidor=Integer.parseInt(request.getParameter("txtPrecioDistribuidor"));
            double peso=Double.parseDouble(request.getParameter("txtPeso"));
            int diametro=Integer.parseInt(request.getParameter("txtDiametro"));
         
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            
            Producto base=em.find(Producto.class, id);
            if(!base.getNombre().equals(nombreProducto))
            {
                base.setNombre(nombreProducto);
            }
            if(!base.getDescripcion().equals(descripcion))
            {
                base.setDescripcion(descripcion);
            }
            if(base.getPrecioVendedor()!=precioVendedor)
            {
                base.setPrecioVendedor(precioVendedor);
            }
            if(base.getPrecioVenta()!=precioVenta)
            {
                base.setPrecioVenta(precioVenta);
            }
            if(base.getPrecioCompra()!= precioCompra)
            {
                base.setPrecioCompra(precioCompra);
            }
            if(base.getPrecioDistribuidor()!= precioDistribuidor)
            {
                base.setPrecioDistribuidor(precioDistribuidor);
            }
            if(base.getAltura()!=alto)
            {
                base.setAltura(alto);
            }
            if(base.getAncho()!=ancho)
            {
                base.setAncho(ancho);
            }
            if(base.getLargo()!=largo)
            {
                base.setLargo(largo);
            }
            if(base.getAltoProducto()!=altoProducto)
            {
                base.setAltoProducto(altoProducto);
            }
            if(base.getAnchoProducto()!=anchoProducto)
            {
                base.setAnchoProducto(anchoProducto);
            }
            if(base.getLargoProducto()!=largoProducto)
            {
                base.setLargoProducto(largoProducto);
            }
            if(base.getStock()!=stockInicial)
            {
                base.setStock(stockInicial);
            }
            if(base.getStockCritico()!=stockCritico)
            {
                base.setStockCritico(stockCritico);
            }
            if(base.getPeso()!=peso)
            {
                base.setPeso(peso);
            }
            if(base.getDiametro()!=diametro)
            {
                base.setDiametro(diametro);
            }
            em.getTransaction().begin();
            em.merge(base);
            em.getTransaction().commit();
            
            HttpSession s=request.getSession();
            s.setAttribute("MensajePagina", "Producto editado...");
            s.setAttribute("url", "../Employees/Productos.jsp");
            response.sendRedirect("Paginas/Mensaje.jsp");
        }
        catch(Exception e)
        {
            e.getMessage();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
