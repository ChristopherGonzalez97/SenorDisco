/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Venta;
import Clases.VentaPK;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "BuscarCompra", urlPatterns = {"/BuscarCompra"})
public class BuscarCompra extends HttpServlet {

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
            int idCompra = Integer.parseInt(request.getParameter("txtIdVenta"));
            String rut = request.getParameter("txtRut");
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            boolean verify = Captcha.Captcha.verify(gRecaptchaResponse);
            HttpSession s = request.getSession();
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            try{
                Venta venta = (Venta) em.createNamedQuery("Venta.findByIdventa").setParameter("idventa", idCompra).getSingleResult();
                if(venta.getUsuario().getClienteList().get(0).getRutCliente().equals(rut) || venta.getDespachoList().get(0).getDestinatarioidDestinatario().getRut().equals(rut) && verify)
                {
                    s.setAttribute("venta", venta);
                    response.sendRedirect("Paginas/Compra.jsp");
                }
                else {
                    throw new Exception("Combinacion Id y Rut no es valida");
                }
            }catch(Exception e)
            {
                if(e.getMessage().equals("getSingleResult() did not retrieve any entities."))
                {
                    s.setAttribute("errorMessage", "Combinacion Id y Rut no es valida");
                }else
                {
                    s.setAttribute("errorMessage", e.getMessage());
                }        
                response.sendRedirect("Paginas/BuscarCompra.jsp");
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
