/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.DetallePedido;
import Clases.Producto;
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
@WebServlet(name = "AgregarAgendamiento", urlPatterns = {"/AgregarAgendamiento"})
public class AgregarAgendamiento extends HttpServlet {

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
            HttpSession s =request.getSession();
            int id = Integer.parseInt(request.getParameter("txtIdProducto").trim());
            int cantidad= Integer.parseInt(request.getParameter("txtCantidad").trim());
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            Producto pro = em.find(Producto.class, id);
            
            if(s.getAttribute("agendamiento")==null)
            {
                List<DetallePedido> pedido = new ArrayList<DetallePedido>();
                DetallePedido det = new DetallePedido();
                det.setCantidad(cantidad);
                det.setProducto(pro);
                pedido.add(det);
                s.setAttribute("agendamiento", pedido);
            }
            else{
                List<DetallePedido> pedido = (List<DetallePedido>) s.getAttribute("agendamiento");
                DetallePedido det = new DetallePedido();
                boolean flag =false;
                for(DetallePedido d:pedido)
                {
                    if(d.getProducto().getIdproducto()==pro.getIdproducto())
                    {
                        d.setCantidad(cantidad+d.getCantidad());
                        flag=true;
                    }
                }
                if(!flag)
                {
                    det.setCantidad(cantidad);
                    det.setProducto(pro);
                    pedido.add(det);
                }
                s.setAttribute("agendamiento", pedido);
            }
            response.sendRedirect("Employees/Agendamiento.jsp");
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
