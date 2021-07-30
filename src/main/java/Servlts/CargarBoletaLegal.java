/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Venta;
import com.SendMail;
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
 * @author pc
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet(name = "CargarBoletaLegal", urlPatterns = {"/CargarBoletaLegal"})
public class CargarBoletaLegal extends HttpServlet {

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
            InputStream imagen = null;
            Part filePart = request.getPart("flImagen");

            if (filePart !=null) 
            {
                if (filePart.getContentType().contains("image")) 
                {
                    imagen = filePart.getInputStream();
                }
            }
            byte[] picInBytes =new byte[(int)filePart.getSize()];
            imagen.read(picInBytes);
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            String id = request.getParameter("txtIdVenta");
            Venta venta = em.createNamedQuery("Venta.findByIdventa",Venta.class).setParameter("idventa", Integer.parseInt(id)).getSingleResult();
            venta.setBoletaLegal(picInBytes);
            em.getTransaction().begin();
            em.merge(venta);
            em.getTransaction().commit();
            SendMail.EnviarBoleta(picInBytes);
            HttpSession s = request.getSession();          
            s.setAttribute("MensajePagina", "Boleta agregada correctamente <br> redireccionando...");
            s.setAttribute("url", "../Employees/Ventas.jsp");
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
