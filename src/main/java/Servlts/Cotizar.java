/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Despacho;
import Clases.DetalleVenta;
import Clases.Producto;
import Despacho.ChileExpress;
import Despacho.ComunaChileExpress;
import Despacho.PaqueteChileExpress;
import Despacho.Resultado;
import Enviame.Carrier;
import Enviame.CarrierService;
import Enviame.DespachoEnviame;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author chris
 */
@WebServlet(name = "Cotizar", urlPatterns = {"/Cotizar"})
public class Cotizar extends HttpServlet {

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
            HttpSession s= request.getSession();
            if(!request.getParameter("txtAdicionales").equals(""))
            {
                String datosAdicionales = request.getParameter("txtAdicionales");
                s.setAttribute("datosAdicionales", datosAdicionales);
            }
            List<DetalleVenta> carro = (List<DetalleVenta>) s.getAttribute("carro");
            String direccion = s.getAttribute("direccionEnviame").toString();
            String dir []= StringUtils.split(direccion, ",");
            String region = dir[0];
            String comuna = dir[1];
            comuna = StringUtils.replace(comuna," ","_");
            String calle = dir[2]+""+dir[3];
            DespachoEnviame despachoBLX = new DespachoEnviame();
            despachoBLX.setEmpresa("Blue Express");
            despachoBLX.setCodEnvio("priority");
            DespachoEnviame despachoSKN = new DespachoEnviame();
            despachoSKN.setEmpresa("Starken");
            despachoSKN.setCodEnvio("normal");
            double peso=0;
            try{
            for(DetalleVenta c:carro)
            {
                double pesoadd=0;
                pesoadd= c.getProducto().getPeso()*c.getCantidad();
                peso=peso+pesoadd;
                
            }
            Carrier blx = new Carrier();
            Carrier skn= new Carrier();
            blx = Enviame.Enviame.TarifadorBLX(peso,"SANTIAGO",comuna);
            List<CarrierService> servicios = blx.getServices();
            for(CarrierService d:servicios)
            {
                if(d.getCode().equalsIgnoreCase("priority"))
                {
                    despachoBLX.setValor(d.getPrice());
                }
            }
            skn = Enviame.Enviame.TarifadorSKN(peso,"SANTIAGO",comuna);
            servicios=skn.getServices();
            for(CarrierService d:servicios)
            {
                if(d.getCode().equalsIgnoreCase("normal"))
                {
                    int total = despachoSKN.getValor() + d.getPrice();
                    despachoSKN.setValor(total);
                }
            }
            }
            catch(Exception e){
                e.getMessage();
            }
                Despacho despachoSKNs=new Despacho();
                despachoSKNs.setCompañia("Starken");
                despachoSKNs.setTipo("normal");
                despachoSKN.setValor(Enviame.Enviame.Redondear(despachoSKN.getValor()));
                despachoSKNs.setValor(despachoSKN.getValor());
                despachoSKNs.setDireccion(direccion);
                despachoSKNs.setCodigoDespacho(1);
                
                Despacho despachoBLXs=new Despacho();
                despachoBLXs.setCompañia("Blue express");
                despachoBLXs.setTipo("priority");
                despachoBLX.setValor(Enviame.Enviame.Redondear(despachoBLX.getValor()));
                despachoBLXs.setValor(despachoBLX.getValor());
                despachoBLXs.setDireccion(direccion);
                despachoBLXs.setCodigoDespacho(1);
                
                List<Despacho> despachos = new ArrayList<Despacho>();
                if(despachoBLX.getValor()>1000)
                {
                    despachos.add(despachoBLXs);
                }
                if(despachoSKN.getValor()>1000)
                {
                    despachos.add(despachoSKNs);
                }
                s.setAttribute("despacho", despachos);
                response.sendRedirect("Paginas/Despacho.jsp");
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
