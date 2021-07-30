/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Cliente;
import Clases.Persona;
import Clases.Usuario;
import com.appsdeveloperblog.encryption.PasswordUtils;
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
@WebServlet(name = "CambiarPass", urlPatterns = {"/CambiarPass"})
public class CambiarPass extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String passActual=request.getParameter("txtPass");
            String passNueva= request.getParameter("txtPassNueva");
            
             
            HttpSession s = request.getSession();
            Cliente cliente=(Cliente)s.getAttribute("Usuario");
            Persona persona = cliente.getPersona();
            Usuario user= cliente.getUsuarioIdusuario();
            
            boolean verificado = PasswordUtils.verifyUserPassword(passActual, user.getClave(), user.getSalt());
            if(verificado)
            {
                 String salt = PasswordUtils.getSalt(30);
                 String passSegura=PasswordUtils.generateSecurePassword(passNueva, salt);
                 user.setClave(passSegura);
                 user.setSalt(salt);
                 
                EntityManagerFactory emf ;
                emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
                EntityManager em = emf.createEntityManager();
                
                em.getTransaction().begin();
                em.merge(user);
                em.getTransaction().commit();
                
                response.sendRedirect("Paginas/EditarCliente.jsp");
            }
            else{
                throw new Exception("Contraseña incorrecta");
            }
            
        }catch(Exception e)
        {
            HttpSession s = request.getSession();
            s.setAttribute("errorMessage", e.getMessage());
            response.sendRedirect("Paginas/CambiarPass.jsp");
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
