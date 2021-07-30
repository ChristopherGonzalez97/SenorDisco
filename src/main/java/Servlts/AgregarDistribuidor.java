/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Cliente;
import Clases.Comuna;
import Clases.Distribuidor;
import Clases.Region;
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
@WebServlet(name = "AgregarDistribuidor", urlPatterns = {"/AgregarDistribuidor"})
public class AgregarDistribuidor extends HttpServlet {

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
            String nombre = request.getParameter("txtNombre");
            String rut= request.getParameter("txtRut");
            String email =request.getParameter("txtEmail");
            String telefono= request.getParameter("txtTelefono");
            String direccion= request.getParameter("txtDireccion");
            String password = request.getParameter("txtPass");
            int region= Integer.parseInt(request.getParameter("txtRegion"));
            String comuna="";
            int nComuna=0;
            int comunaTotales= Integer.parseInt(request.getParameter("txtTotal"));
            for (int i = 1; i <comunaTotales+1; i++) {
                if(!request.getParameter("txtComuna"+i).equals("Seleccione comuna de residencia..."))
                {
                    comuna=request.getParameter("txtComuna"+i);
                    nComuna=i;
                }
            }
            String salt = PasswordUtils.getSalt(30);
            String passSegura=PasswordUtils.generateSecurePassword(password, salt);
            
            
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            
            int idUsuario= em.createNamedQuery("Usuario.findAll").getResultList().size()+1;
            
            Region regio =(Region) em.createNamedQuery("Region.findByIdregion").setParameter("idregion", region).getResultList().get(0);
            Comuna com=(Comuna) em.createNamedQuery("Comuna.findByIdcomuna").setParameter("idcomuna", nComuna).getResultList().get(0);
           
            if(em.createNamedQuery("Usuario.findByCorreo").setParameter("correo", email).getResultList().size()!=0)
            {
                throw new Exception("Correo electronico en uso");
            }
            if(em.createNamedQuery("Cliente.findByRutCliente").setParameter("rutCliente", rut).getResultList().size()!=0)
            {
                throw new Exception("El rut ingresado ya esta registrado");
            }
            
            Distribuidor distribuidor=new Distribuidor();
            Cliente cliente=new Cliente();
            Usuario user = new Usuario();
            
            distribuidor.setClienteRutCliente(rut);
            distribuidor.setNombre(nombre);
            
            cliente.setComuna(com);
            cliente.setDireccion(direccion);
            cliente.setRutCliente(rut);
            cliente.setTelefono(telefono);
            
            user.setClave(passSegura);
            user.setSalt(salt);
            user.setCorreo(email);
            user.setHabilitado(Short.parseShort("1"));
            user.setIdusuario(idUsuario);
            
            cliente.setDistribuidor(distribuidor);
            cliente.setUsuarioIdusuario(user);
            distribuidor.setCliente(cliente);
            
            em.getTransaction().begin();
            em.persist(distribuidor);
            em.persist(cliente);
            em.persist(user);
            em.getTransaction().commit();
            HttpSession s = request.getSession();
            s.setAttribute("Usuario", user);
            response.sendRedirect("index.jsp");
            
        }catch(Exception e)
        {
            HttpSession s = request.getSession();
            s.setAttribute("errorMessage", e.getMessage());
            response.sendRedirect("Paginas/RegistrarDistribuidor.jsp");
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
