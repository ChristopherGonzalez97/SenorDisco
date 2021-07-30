/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Boleta;
import Clases.Cliente;
import Clases.Despacho;
import Clases.Destinatario;
import Clases.DetalleVenta;
import Clases.DocumentoTributario;
import Clases.Venta;
import Clases.VentaPK;
import WebPay.WebPay;
import cl.transbank.webpay.webpayplus.model.WebpayPlusTransactionCreateResponse;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
@WebServlet(name = "CompraSinDespacho", urlPatterns = {"/CompraSinDespacho"})
public class CompraSinDespacho extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           HttpSession s = request.getSession();
           List<DetalleVenta> carro = (List<DetalleVenta>) s.getAttribute("carro");
           int totalCarro=0;
           for(DetalleVenta d:carro)
           {
               totalCarro=totalCarro+d.getTotalProducto();
           }
           Boleta boleta = new Boleta();
           boleta.setMontoFinal(totalCarro);
           //Falta metodo de pago y Venta
           DocumentoTributario dt = new DocumentoTributario();
           dt.setBoleta(boleta);
           List<DocumentoTributario> dts = new ArrayList();
           dts.add(dt);
           
           EntityManagerFactory emf ;
           emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
           EntityManager em = emf.createEntityManager();
           int id =em.createNamedQuery("Producto.findAll").getResultList().size()+1; 
           
           //Falta Usuario
           VentaPK ventapk=new VentaPK();
           ventapk.setIdventa(id);
           //Falta estado ,fecha, Usuario
           Venta venta = new Venta();
         
           
           venta.setDetalleVentaList(carro);
           //venta.setFecha(fecha);
           venta.setDocumentoTributarioList(dts);
           venta.setVentaPK(ventapk);
           WebpayPlusTransactionCreateResponse responses = WebPay.ObtenerLink(venta, s.getId());
           s.setAttribute("responses", responses);
           s.setMaxInactiveInterval(800);// session timeout in minutes
           if(s.getAttribute("Usuario")!=null)
           {
               Cliente cli = (Cliente) s.getAttribute("Usuario");
               venta.setUsuario(cli.getUsuarioIdusuario());
               Destinatario destinatario = new Destinatario();
               destinatario.setEmail(cli.getUsuarioIdusuario().getCorreo());
               destinatario.setRut(cli.getRutCliente());
               destinatario.setNombre(cli.getPersona().getNombre());
               destinatario.setApellido(cli.getPersona().getApellidoPaterno());
               destinatario.setTelefono(cli.getTelefono());
               List<Despacho> desp= new ArrayList<Despacho>();
               List<Despacho> despacho= (List<Despacho>) s.getAttribute("despacho");
               desp.add(despacho.get(0));
               venta.setDespachoList(desp);
               
               
               s.setAttribute("venta", venta);
               
               response.sendRedirect("Paginas/Pagar.jsp");
           }
           else{
               List<Despacho> desp= new ArrayList<Despacho>();
                Despacho SinDespacho = new Despacho();
              SinDespacho.setTipo("Sin Despacho");
              SinDespacho.setCodigoDespacho(0);
               desp.add(SinDespacho);
               venta.setDespachoList(desp);
               s.setAttribute("venta", venta);
               response.sendRedirect("Paginas/IdentificarContacto.jsp");
           }
        }catch(Exception e)
        {
            System.out.println(e.getMessage());
            out.println(e.getMessage());
            
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
