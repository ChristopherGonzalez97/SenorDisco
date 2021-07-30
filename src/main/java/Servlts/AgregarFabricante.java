/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Fabricante;
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
 * @author chris
 */
@WebServlet(name = "AgregarFabricante", urlPatterns = {"/AgregarFabricante"})
public class AgregarFabricante extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            
            String rut = request.getParameter("txtRut"); 
            String nombre=request.getParameter("txtNombreFabricante");
            int telefono=Integer.parseInt(request.getParameter("txtTelefono"));
            String banco=request.getParameter("txtBanco");
            String cuenta=request.getParameter("txtNumeroCuenta");
            String tl;
            tl = String.valueOf(telefono);
            Fabricante fabricante= new Fabricante();
            fabricante.setRut(rut);
            fabricante.setNombre(nombre);
            fabricante.setTelefono(tl);
            fabricante.setBanco(banco);
            fabricante.setNcuenta(cuenta);
            try{
            if(em.find(Fabricante.class, rut)!=null)
            {
                 throw new Exception("Rut en uso");
            }
            em.getTransaction().begin();
            em.persist(fabricante);
            em.getTransaction().commit();
            
            HttpSession s = request.getSession();          
            s.setAttribute("MensajePagina", "Fabricante agregado correctamente <br> redireccionando...");
            s.setAttribute("url", "../Employees/AgregarFabricante.jsp");
            response.sendRedirect("Paginas/Mensaje.jsp");
            
        }
            catch(Exception ex)
        {
            HttpSession s = request.getSession();
            s.setAttribute("errorMessage", ex.getMessage());
            response.sendRedirect("Employees/AgregarFabricante.jsp");
        }

        }
        catch(Exception ex)
        {
            HttpSession s = request.getSession();
            s.setAttribute("errorMessage", ex.getMessage());
            response.sendRedirect("Employees/AgregarFabricante.jsp");
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
