/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.DetalleVenta;
import Clases.Producto;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chris
 */
@WebServlet(name = "CarroCompra", urlPatterns = {"/CarroCompra"})
public class CarroCompra extends HttpServlet {

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
            int itemsCantidad = Integer.parseInt(request.getParameter("itemsList"));
            List<DetalleVenta> carro = new ArrayList();
            HttpSession s = request.getSession();
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            try{
                for (int i = 1; i < itemsCantidad+1; i++) {
                    String nombreProd= request.getParameter("shipping_"+i);
                    String prueba = nombreProd.trim();
                    String[] posiciones;
                    String a = nombreProd.replace('\r', '-');
                    posiciones=a.split("-");
                    nombreProd=posiciones[0];
                    Producto pro= new Producto();
                    int id=0;
                    id=Integer.parseInt(nombreProd);
                    pro= em.find(Producto.class, id);
                    String cantidad= request.getParameter("quantity_"+i);
                    int can = Integer.parseInt(cantidad);
                    if( can > pro.getStock())
                    {
                       s.setAttribute("ProdError", pro);
                       throw new Exception("Pedido supera el stock de la tienda realize un agendamiento");  
                    } 
                    DetalleVenta dv= new DetalleVenta();
                    dv.setProducto(pro);
                    dv.setCantidad(Integer.parseInt(cantidad));
                    carro.add(dv);

                }
                 s.setAttribute("carro", carro);
                 response.sendRedirect("Paginas/Carro.jsp");
            
            }
            catch(Exception e)
            {
                s.setAttribute("ErrorStock", e.getMessage());
                Producto pro = (Producto) s.getAttribute("ProdError");
                String url ="Paginas/Producto.jsp?id="+pro.getIdproducto();
                response.sendRedirect(url);
             }
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
