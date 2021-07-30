/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Venta;
import com.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
 * @author pc
 */
@WebServlet(name = "CambiarEstado", urlPatterns = {"/CambiarEstado"})
public class CambiarEstado extends HttpServlet {

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
            String url = request.getQueryString();
            String[] posiciones = url.split("=");
            String id = posiciones[1];
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            
            List<Venta> ventas = em.createNamedQuery("Venta.findAll").getResultList();
            Venta resu = new Venta();
            for(Venta v:ventas)
            {
                if(v.getVentaPK().getIdventa()==Integer.parseInt(id))
                {
                     resu= v;
                }
            }
            if(resu.getEstado().equals("Realizada"))
            {
                resu.setEstado("Despachada");
            }
            else if(resu.getEstado().equals("Despachada"))
            {
                resu.setEstado("Finalizada");
            }
            
            em.getTransaction().begin();
            em.merge(resu);
            em.getTransaction().commit();
            SendMail.VentaEstado(resu.getDespachoList().get(0).getDestinatarioidDestinatario().getEmail(),resu);
            HttpSession s=request.getSession();
            s.setAttribute("MensajePagina", "Estado actualizado...");
            s.setAttribute("url", "../Employees/Ventas.jsp");
            response.sendRedirect("Paginas/Mensaje.jsp");
            
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
