/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Despacho;
import Clases.DetalleVenta;
import Clases.Venta;
import Clases.Destinatario;
import Despacho.Address;
import Despacho.CalleChileExpress;
import Despacho.Certificado;
import Despacho.ChileExpress;
import Despacho.ComunaChileExpress;
import Despacho.Contacto;
import Despacho.Header;
import Despacho.NumeracionChileExpress;
import Despacho.Packet;
import Despacho.RegionChileExpress;
import Despacho.Response;
import Enviame.CompañiaRetiro;
import Enviame.Enviame;
import Enviame.Envio;
import Enviame.Retiro;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
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
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author pc
 */
@WebServlet(name = "GenerarEnvio", urlPatterns = {"/GenerarEnvio"})
public class GenerarEnvio extends HttpServlet {

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
            HttpSession s = request.getSession(false);
            Venta v =(Venta) s.getAttribute("venta");
            String url = request.getQueryString();
            String[] posiciones = url.split("=");
            String id = posiciones[1];
            id = StringUtils.removeStart(id, "id");
            switch(Integer.parseInt(id)){
                case 0:
                    s.setAttribute("metodoPago","Debito");
                    break;
                case 1:
                    s.setAttribute("metodoPago","Venta Normal");
                    break;
                case 2:
                    s.setAttribute("metodoPago","Venta en cuotas");
                    break;
                case 3:
                    s.setAttribute("metodoPago","3 Cuotas sin interes");
                    break;
                 case 4:
                    s.setAttribute("metodoPago","2 Cuotas sin interes");
                    break;
                 case 5:
                    s.setAttribute("metodoPago","Venta Prepago");
                    break;
                 case 6:
                    s.setAttribute("metodoPago","Cuotas sin interes");
                    break;
                default:
                    s.setAttribute("metodoPago","Venta normal");
                    break;    
            }
            
            if(v.getDespachoList().get(0).getCodigoDespacho()!=0)
            {
                Envio envio = new Envio();
                 //int volumen ,Despacho despacho
                int cantBultos=0;
                String contenido="";
                String direccion = (String) s.getAttribute("direccionEnviame");
                String passer []= StringUtils.split(direccion, ",");
                String comuna = StringUtils.stripAccents(passer[1]);
                List<DetalleVenta> d = v.getDetalleVentaList();
                direccion = passer[0]+","+passer[1]+","+passer[2]+" "+passer[3];
                Destinatario destinatario = new Destinatario();
                destinatario = v.getDespachoList().get(0).getDestinatarioidDestinatario();
                Despacho despacho = new Despacho();
                despacho = v.getDespachoList().get(0);
                double peso=0;
                int precioProductos=0;
                for(DetalleVenta f:d)
                {
                    precioProductos=f.getTotalProducto()+precioProductos;
                    cantBultos=cantBultos+f.getCantidad();
                    contenido= contenido+" "+f.getProducto().getNombre()+"x"+f.getCantidad()+" ,";
                }
                String datosAdicionales ="";
                if(s.getAttribute("datosAdicionales")!=null)
                {
                    datosAdicionales=(String) s.getAttribute("datosAdicionales");
                }
                EntityManagerFactory emf ;
                emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
                EntityManager em = emf.createEntityManager();
                String codCarrier="";
                int idDespacho = em.createNamedQuery("Despacho.findAll").getResultList().size()+1; 
                
                if(despacho.getCompañia().equalsIgnoreCase("Blue Express"))
                {
                    codCarrier="BLX";
                }else
                {
                    codCarrier="SKN";
                }
                envio = Enviame.CrearEnvio(cantBultos, contenido, idDespacho, precioProductos, datosAdicionales, comuna, direccion, destinatario, despacho, codCarrier);
                s.setAttribute("envio", envio);
                
                List<CompañiaRetiro> retiros = Enviame.ListarRetiros();
                Date date = Calendar.getInstance().getTime();  
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
                String dates = dateFormat.format(date);
                dates=Enviame.nextDiaHabil(dates);
                boolean flag=false;
                String idRetiro="";
                int qty=0;
                for(CompañiaRetiro r : retiros)
                {
                    if(r.getCodRetiro().equalsIgnoreCase(codCarrier))
                    {
                        List<Retiro> ret = new ArrayList<Retiro>();
                        ret=r.getRetiroList();
                        for(Retiro re:ret)
                        {
                            if(re.getFecha().equalsIgnoreCase(dates))
                            {
                                flag=true;
                                idRetiro=re.getIdRetiro();
                                qty=re.getQty();
                            }
                        }
                    }
                }
                qty=qty+cantBultos;
                String q= Integer.toString(qty);
                if(flag)
                {
                    Enviame.EditarRetiro(idRetiro,q);
                }else
                {
                    Enviame.CrearRetiro(q,dates,codCarrier);
                }
            }
            
            response.sendRedirect("AgregarVenta");
            
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
