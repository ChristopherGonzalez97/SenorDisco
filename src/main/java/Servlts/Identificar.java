/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Cliente;
import Clases.Comuna;
import Clases.Despacho;
import Clases.Destinatario;
import Clases.Persona;
import Clases.Usuario;
import Clases.Venta;
import Despacho.CalleChileExpress;
import Despacho.ComunaChileExpress;
import Despacho.NumeracionChileExpress;
import com.appsdeveloperblog.encryption.PasswordUtils;
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
@WebServlet(name = "Identificar", urlPatterns = {"/Identificar"})
public class Identificar extends HttpServlet {

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
          HttpSession s = request.getSession();
          String nombre = request.getParameter("txtNombre");
          String apellido = request.getParameter("txtApellido");
          String rut = request.getParameter("txtRut");
          String mail = request.getParameter("txtMail");
          String telefono = request.getParameter("txtTelefono");
          Destinatario destinatario=new Destinatario();
          if(request.getParameter("rdbRegistro").equalsIgnoreCase("Si")){
              
                destinatario.setRut(rut);
                destinatario.setNombre(nombre);
                destinatario.setApellido(apellido);
                destinatario.setEmail(mail);
                destinatario.setTelefono(telefono);
              
              
              EntityManagerFactory emf ;
              emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
              EntityManager em = emf.createEntityManager();
              try{
                if(em.createNamedQuery("Usuario.findByCorreo").setParameter("correo", mail).getResultList().size()!=0)
                {
                    throw new Exception("Correo electronico en uso");
                }
                if(em.createNamedQuery("Cliente.findByRutCliente").setParameter("rutCliente", rut).getResultList().size()!=0)
                {
                    throw new Exception("El rut ingresado ya esta registrado");
                }
              ComunaChileExpress comunaResultado=(ComunaChileExpress)s.getAttribute("ComunaResultado");
              String nombreComuna=comunaResultado.getCountyName();
              
              Comuna comuna= new Comuna();
              comuna= em.createNamedQuery("Comuna.findByNombre", Comuna.class).setParameter("nombre", nombreComuna).getSingleResult();
              
              int idUsuario= em.createNamedQuery("Usuario.findAll").getResultList().size()+1;
              
              String pass=request.getParameter("txtPass"); 
              Usuario user=new Usuario();
              Cliente cli=new Cliente();
              Persona persona = new Persona();
              
              String salt = PasswordUtils.getSalt(30);
              String passSegura=PasswordUtils.generateSecurePassword(pass, salt);
              
              persona.setNombre(nombre);
              persona.setApellidoPaterno(apellido);
              persona.setApellidoMaterno("");
              persona.setClienteRutCliente(rut);

              cli.setRutCliente(rut);
              cli.setTelefono(telefono);
              CalleChileExpress calleResultado=(CalleChileExpress)s.getAttribute("CalleResultado");
              NumeracionChileExpress numeracionResultado=(NumeracionChileExpress)s.getAttribute("DireccionnResultado");
              cli.setDireccion(calleResultado.getStreetName()+" "+numeracionResultado.getNumber());
              cli.setPersona(persona);
              cli.setComuna(comuna);
              
              user.setClave(passSegura);
              user.setSalt(salt);
              user.setCorreo(mail);
              user.setHabilitado(Short.parseShort("1"));
              user.setIdusuario(idUsuario);
              
              persona.setCliente(cli);
              cli.setUsuarioIdusuario(user);
              cli.setPersona(persona);
              
              
              em.getTransaction().begin();
              em.persist(persona);
              em.persist(cli);
              em.persist(user);
              em.getTransaction().commit();
              
              Venta venta=(Venta)s.getAttribute("venta");
              List<Despacho> des= new ArrayList<Despacho>();
              des=venta.getDespachoList();
                for(Despacho desp:des)
                {
                    desp.setDestinatarioidDestinatario(destinatario);
                }
                venta.setDespachoList(des);
           
              
              s.setAttribute("venta", venta);
              s.setAttribute("Usuario", cli);
               response.sendRedirect("Paginas/Pagar.jsp");
              
          }catch(Exception e)
          {
                s.setAttribute("errorMessage", e.getMessage());
                 response.sendRedirect("Paginas/IdentificarContacto.jsp");
          }}    
          else{
            
            destinatario.setRut(rut);
            destinatario.setNombre(nombre);
            destinatario.setApellido(apellido);
            destinatario.setEmail(mail);
            destinatario.setTelefono(telefono);
            
            Venta venta=(Venta)s.getAttribute("venta");
            if(venta.getDespachoList()!=null)
            {
                List<Despacho> des= new ArrayList<Despacho>();
                des=venta.getDespachoList();
                for(Despacho desp:des)
                {
                    desp.setDestinatarioidDestinatario(destinatario);
                }
                venta.setDespachoList(des);
            }
            response.sendRedirect("Paginas/Pagar.jsp");
          }
         
        }
        catch(Exception ex)
        {
            ex.getMessage();
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
