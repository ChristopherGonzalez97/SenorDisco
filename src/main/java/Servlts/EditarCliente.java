/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Cliente;
import Clases.Persona;
import Clases.Usuario;
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
@WebServlet(name = "EditarCliente", urlPatterns = {"/EditarCliente"})
public class EditarCliente extends HttpServlet {

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
            String primerNombre = request.getParameter("txtPrimerNombre");
            String segundoNombre = request.getParameter("txtSegundoNombre");
            String apellidoPaterno = request.getParameter("txtApellidoPaterno");
            String apellidoMaterno = request.getParameter("txtApellidoMaterno");
            String email =request.getParameter("txtEmail");
            String telefono= request.getParameter("txtTelefono");
            
            HttpSession s = request.getSession();
            Cliente cliente=(Cliente)s.getAttribute("Usuario");
            Persona persona = cliente.getPersona();
            Usuario user= cliente.getUsuarioIdusuario();
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_Disco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            
           if(!user.getCorreo().equals(email))
            {
                if(em.createNamedQuery("Usuario.findByCorreo").setParameter("correo", email).getResultList().size()!=0)
                {
                    throw new Exception("Correo electronico en uso");
                }
                user.setCorreo(email);
            }
            if(!cliente.getTelefono().equals(telefono))
            {
                cliente.setTelefono(telefono);
            }
            if(!persona.getNombre().equals(primerNombre))
            {
                persona.setNombre(primerNombre);
            }
            if(!persona.getApellidoPaterno().equals(apellidoPaterno))
            {
                persona.setApellidoPaterno(apellidoPaterno);
            }
            if(!persona.getApellidoMaterno().equals(apellidoMaterno))
            {
                persona.setApellidoMaterno(apellidoMaterno);
            }
            if(segundoNombre!=null)
            {
                persona.setSegundoNombre(segundoNombre);
            }
            
            cliente.setUsuarioIdusuario(user);
            persona.setCliente(cliente);
            cliente.setPersona(persona);
            
            
            
            em.getTransaction().begin();
            em.merge(persona);
            em.merge(cliente);
            em.merge(user);
            em.getTransaction().commit();
            
            s.setAttribute("Usuario", cliente);
            
            response.sendRedirect("Paginas/EditarCliente.jsp");
        }
        catch(Exception e)
        {
             HttpSession s = request.getSession();
            s.setAttribute("errorMessage", e.getMessage());
            response.sendRedirect("Paginas/EditarCliente.jsp");
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
