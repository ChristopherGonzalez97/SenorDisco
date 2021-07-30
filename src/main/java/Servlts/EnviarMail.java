/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Cliente;
import Clases.Pass;
import Clases.Usuario;
import com.SendMail;
import com.appsdeveloperblog.encryption.PasswordUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
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
@WebServlet(name = "EnviarMail", urlPatterns = {"/EnviarMail"})
public class EnviarMail extends HttpServlet {

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
            String mail = request.getParameter("txtMail");
            String rut = request.getParameter("txtRut");
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            if(em.createNamedQuery("Cliente.findByRutCliente").setParameter("rutCliente", rut).getSingleResult()!=null)
            {
                Cliente cli =(Cliente) em.createNamedQuery("Cliente.findByRutCliente").setParameter("rutCliente", rut).getResultList().get(0);
                Usuario user= cli.getUsuarioIdusuario();
                String generatedString =Pass.generateRandomPassword(10);
                String salt = PasswordUtils.getSalt(30);
                String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
                boolean verify = Captcha.Captcha.verify(gRecaptchaResponse);
                String passSegura=PasswordUtils.generateSecurePassword(generatedString, salt);
                if(user.getCorreo().equals(mail) && verify)
                {
                    em.getTransaction().begin();
                    user.setClave(passSegura);
                    user.setSalt(salt);
                    em.merge(user);
                    em.getTransaction().commit();
                    SendMail.EnviarContraseña(mail, generatedString);
                }
            }
            HttpSession s = request.getSession();
            s.setAttribute("MensajePagina", "Si el rut corresponde a este mail su nueva contraseña sera enviada a su mail <br> redireccionando");
            s.setAttribute("url", "InicioSesion.jsp");
            response.sendRedirect("Paginas/Mensaje.jsp");
            
        }catch(Exception e)
        {
            HttpSession s = request.getSession();
            s.setAttribute("MensajePagina", "Si el rut corresponde a este mail su nueva contraseña sera enviada a su mail <br> redireccionando");
            s.setAttribute("url", "InicioSesion.jsp");
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
