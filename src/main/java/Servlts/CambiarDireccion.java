/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Cliente;
import Clases.Comuna;
import Clases.Persona;
import Clases.Region;
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
@WebServlet(name = "CambiarDireccion", urlPatterns = {"/CambiarDireccion"})
public class CambiarDireccion extends HttpServlet {

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
            String direccion= request.getParameter("txtDireccion");
            int region= Integer.parseInt(request.getParameter("txtRegion"));
            String comuna="";
            int nComuna=0;
            int comunaTotales= Integer.parseInt(request.getParameter("txtTotal"));
            for (int i = 1; i <comunaTotales+1; i++) {
                if(!request.getParameter("txtComuna"+i).equals("Seleccione comuna de residencia..."))
                {
                    comuna=request.getParameter("txtComuna"+i);
                    nComuna=Integer.parseInt(comuna.trim());
                }
            }  
            comuna=comuna.trim();
            nComuna=Integer.parseInt(comuna);
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_Disco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            
            HttpSession s = request.getSession();
            Cliente cliente=(Cliente)s.getAttribute("Usuario");
            Persona persona = cliente.getPersona();
            Usuario user= cliente.getUsuarioIdusuario();
            
            Region regio =(Region) em.createNamedQuery("Region.findByIdregion").setParameter("idregion", region).getResultList().get(0);
            Comuna com=(Comuna) em.createNamedQuery("Comuna.findByIdcomuna").setParameter("idcomuna", nComuna).getResultList().get(0);
            
            cliente.setDireccion(direccion);
            cliente.setComuna(com);
            
            em.getTransaction().begin();
            em.merge(cliente);
            em.getTransaction().commit();
            
            s.setAttribute("Usuario", cliente);
            
            response.sendRedirect("Paginas/EditarCliente.jsp");
            
        }catch(Exception e)
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
