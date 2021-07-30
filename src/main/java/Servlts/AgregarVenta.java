/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Boleta.BoletaGenerator;
import Clases.Boleta;
import Clases.BoletaPK;
import Clases.Bulto;
import Clases.BultoPK;
import Clases.Cliente;
import Clases.Despacho;
import Clases.Destinatario;
import Clases.DetalleVenta;
import Clases.DetalleVentaPK;
import Clases.DocumentoTributario;
import Clases.DocumentoTributarioPK;
import Clases.Factura;
import Clases.Pedido;
import Clases.Producto;
import Clases.Usuario;
import Clases.Venta;
import Clases.VentaPK;
import Despacho.Details;
import Despacho.DetailsResponse;
import Despacho.Response;
import Enviame.Envio;
import cl.transbank.webpay.webpayplus.model.WebpayPlusTransactionCommitResponse;
import com.SendMail;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JEditorPane;

/**
 *
 * @author pc
 */
@WebServlet(name = "AgregarVenta", urlPatterns = {"/AgregarVenta"})
public class AgregarVenta extends HttpServlet {

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
            
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            boolean despacho=false;
            HttpSession s=request.getSession();
            Venta venta=new Venta();
            DocumentoTributario dt = new DocumentoTributario();
          
            venta= (Venta)s.getAttribute("venta");    
            Date fecha = Date.from(Instant.now());
            venta.setFecha(fecha);
            venta.setEstado("Realizada");
           
           
            int idVenta=em.createNamedQuery("Venta.findAll").getResultList().size()+1;
            int idDt =em.createNamedQuery("DocumentoTributario.findAll").getResultList().size()+1;
            int idDestinatario= em.createNamedQuery("Destinatario.findAll").getResultList().size()+1;
            int idBulto= em.createNamedQuery("Bulto.findAll").getResultList().size()+1;
            Cliente cli = new Cliente();
            if(s.getAttribute("Usuario")!=null)
            {
                cli=(Cliente)s.getAttribute("Usuario");
            }else
            {
                cli = em.find(Cliente.class, "1");
            }
            Usuario user = cli.getUsuarioIdusuario();
            dt.setMetodoPago((String) s.getAttribute("metodoPago"));
            Boleta boleta = new Boleta();
            boleta= venta.getDocumentoTributarioList().get(0).getBoleta();
            BoletaPK boletPK=new BoletaPK();
            boletPK.setDocumentoTributarioIddocumentoTributario(idDt);
            boletPK.setDocumentoTributarioVentaIdventa(idVenta);
            boletPK.setDocumentoTributarioVentaUsuarioIdusuario(user.getIdusuario());
            boleta.setBoletaPK(boletPK);
            dt.setBoleta(boleta);
                
            int idDespacho =em.createNamedQuery("Despacho.findAll").getResultList().size()+1;
                
            
            DocumentoTributarioPK dtPK= new DocumentoTributarioPK();
            dtPK.setIddocumentoTributario(idDt);
            dtPK.setVentaIdventa(idVenta);
            dtPK.setVentaUsuarioIdusuario(user.getIdusuario());
            dt.setDocumentoTributarioPK(dtPK);
            boleta.setDocumentoTributario(dt);
            List<Despacho> despachos = venta.getDespachoList();
            Despacho desp= despachos.get(0);
            Destinatario dest=desp.getDestinatarioidDestinatario();
            VentaPK ventaPK= new VentaPK();
            ventaPK.setIdventa(idVenta);
            ventaPK.setUsuarioIdusuario(user.getIdusuario());
            venta.setVentaPK(ventaPK);
            dt.setVenta(venta);
            venta.getDocumentoTributarioList().clear();
            venta.getDocumentoTributarioList().add(dt);
            
            List<DetalleVenta> ventas=venta.getDetalleVentaList();
            int cantBultos=0;
            for(DetalleVenta v:ventas){
                cantBultos++;
                DetalleVentaPK detVentaPK= new DetalleVentaPK();
                detVentaPK.setProductoIdproducto(v.getProducto().getIdproducto());
                detVentaPK.setVentaIdventa(idVenta);
                detVentaPK.setVentaUsuarioIdusuario(user.getIdusuario());
                v.setDetalleVentaPK(detVentaPK);
            }
            venta.setDetalleVentaList(ventas);
            if(s.getAttribute("envio")!=null)
            {
                String direccion = (String) s.getAttribute("direccionEnviame");
                Envio envio = (Envio) s.getAttribute("envio");
                List<Bulto> bultos = new ArrayList<Bulto>();
                int seg=0;
                for (int i = 0; i < cantBultos; i++) {
                    Bulto bulto = new Bulto();
                    BultoPK bultoPK = new BultoPK();
                    bultoPK.setIdBulto(idBulto);
                    bultoPK.setDespachoIddespacho(idDespacho);
                    bulto.setBultoPK(bultoPK);
                    bulto.setOrdenDeTransporte(envio.getIdRastreo());
                    String label ="";
                    label= envio.getEtiqueta();
                    bulto.setEtiqueta(label.getBytes());
                    bulto.setDespacho(desp);
                    bultos.add(bulto);
                    desp.setDireccion(direccion);
                    seg++;
                    idBulto++;
                }
                desp.setBultoList(bultos);
                desp.setIddespacho(idDespacho);
            }else{
                desp.setCompañia("Sin despacho");
                desp.setDireccion("Sin despacho");
                desp.setCodigoDespacho(0);
                desp.setIddespacho(idDespacho);
                despacho=true;
                
            }
            desp.setVenta(venta);
            dest.setIdDestinatario(idDestinatario);
            venta.setUsuario(user);
            em.getTransaction().begin();
            if(s.getAttribute("flagAgenda")!=null)
            {
                Pedido pedido= (Pedido) s.getAttribute("resultadoBuscador");
                pedido.setEstado("Finalizado");
                em.merge(pedido);
                s.removeAttribute("flagAgenda");
                s.removeAttribute("resultadoBuscador");
            }
            else
            {
                for(DetalleVenta dv:ventas)
                {
                    Producto pro = dv.getProducto();
                    pro.setStock(pro.getStock()-dv.getCantidad());
                    em.merge(pro);
                }
            }
            em.persist(venta);
            em.persist(dt);
            em.persist(dest);
            em.persist(desp);
            em.getTransaction().commit();
            if(despacho)
            {
                SendMail.EnviarAvisoCompraSinDespacho(venta);
            }
            SendMail.EnviarAviso(venta,venta.getDespachoList().get(0).getDestinatarioidDestinatario().getEmail());
            s.setAttribute("venta", venta);
            response.sendRedirect("Paginas/Boleta.jsp?id="+venta.getVentaPK().getIdventa());

            }
            catch(Exception e)
            {
                e.getMessage();
            }}

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
