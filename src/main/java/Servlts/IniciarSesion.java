/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Cliente;
import Clases.Empleado;
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
@WebServlet(name = "IniciarSesion", urlPatterns = {"/IniciarSesion"})
public class IniciarSesion extends HttpServlet {

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
            String algo = request.getParameter("txtCorreo");
            String pass=request.getParameter("txtPass");
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            boolean verify = Captcha.Captcha.verify(gRecaptchaResponse);
            
            HttpSession s = request.getSession();
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            
            try
            {
                if(em.createNamedQuery("Usuario.findByCorreo").setParameter("correo", algo).getResultList().size()==0)
                {
                    throw new Exception("Usuario o contraseña incorrectos");
                }else
                {
                    Usuario user= (Usuario) em.createNamedQuery("Usuario.findByCorreo").setParameter("correo", algo).getResultList().get(0);
                    if(user.getHabilitado()=='0')
                    {
                        throw new Exception("Usuario deshabilitado comuniquese con el administrador del sitio");
                    }
                    boolean verificado = PasswordUtils.verifyUserPassword(pass, user.getClave(), user.getSalt());
                    if(verificado && verify)
                    {     
                            if(!em.createNamedQuery("Cliente.byUsuario",Cliente.class).setParameter("usuario", user).getResultList().isEmpty())
                            {
                                Cliente cli=em.createNamedQuery("Cliente.byUsuario",Cliente.class).setParameter("usuario", user).getSingleResult();
                                if(cli.getUsuarioIdusuario().Role())
                                {
                                    s.setAttribute("Usuario", cli);
                                    s.setAttribute("MensajePagina", "Bienvenido administrador<br> redireccionando...");
                                    s.setAttribute("url", "../Employees/Modulador.jsp");
                                    response.sendRedirect("Paginas/Mensaje.jsp");
                                }else{
                                    s.setAttribute("Usuario", cli);
                                    s.setAttribute("MensajePagina", "Inicio de sesion correcto<br> redireccionando...");
                                    s.setAttribute("url", "../index.jsp");
                                    response.sendRedirect("Paginas/Mensaje.jsp");
                                }
                                
                            }else if(!em.createNamedQuery("Empleado.findByUsuarioIdusuario",Empleado.class).setParameter("usuarioIdusuario", user).getResultList().isEmpty())
                            {
                                Empleado emp=em.createNamedQuery("Empleado.findByUsuarioIdusuario",Empleado.class).setParameter("usuarioIdusuario", user).getSingleResult();
                                s.setAttribute("Usuario", emp);
                                response.sendRedirect("Paginas/Admin.jsp");
                            }
                    }
                    else
                    {
                        throw new Exception("Usuario o contraseña incorrectos");
                    }
                }
                
            }
            catch(Exception e)
            {
                s.setAttribute("errorMessage", e.getMessage());
                response.sendRedirect("Paginas/InicioSesion.jsp");
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
