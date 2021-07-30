/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.DetallePedido;
import Clases.DetallePedidoPK;
import Clases.Pedido;
import com.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "CrearAgendamiento", urlPatterns = {"/CrearAgendamiento"})
public class CrearAgendamiento extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession s = request.getSession();
            List<DetallePedido> pedidos = (List<DetallePedido>) s.getAttribute("agendamiento");
            String fecha = request.getParameter("txtFecha");
            String correo= request.getParameter("txtCorreo");
            Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(fecha);  
            Pedido pedido = new Pedido();
            pedido.setEstado("En construccion");
            pedido.setFecha(date1);
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            int idPedido=em.createNamedQuery("Pedido.findAll").getResultList().size()+1;
            int precio=0;
            for(DetallePedido d : pedidos)
            {
                precio=precio+d.getTotalProducto();
                DetallePedidoPK PK= new DetallePedidoPK();
                PK.setPedidoIdpedido(idPedido);
                PK.setProductoIdproducto(d.getProducto().getIdproducto());
                d.setDetallePedidoPK(PK);
            }
            pedido.setIdpedido(idPedido);
            pedido.setDetallePedidoList(pedidos);
            pedido.setCorreo(correo);
            pedido.setPrecio(precio);
            em.getTransaction().begin();
            em.persist(pedido);
            em.getTransaction().commit();
            SendMail.EnviarAgendamiento(correo, pedido);
            s.removeAttribute("agendamiento");
            s.setAttribute("MensajePagina", "Agendamiento creado...");
            s.setAttribute("url", "../Employees/VerAgendamientos.jsp");
            response.sendRedirect("Paginas/Mensaje.jsp");
        }
        catch(Exception e)
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CrearAgendamiento.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CrearAgendamiento.class.getName()).log(Level.SEVERE, null, ex);
        }
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
