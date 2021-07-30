/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Despacho.CalleChileExpress;
import Despacho.ChileExpress;
import Despacho.ComunaChileExpress;
import Despacho.NumeracionChileExpress;
import Despacho.RegionChileExpress;
import Despacho.Regiones;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
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
@WebServlet(name = "ComprobarDireccion", urlPatterns = {"/ComprobarDireccion"})
public class ComprobarDireccion extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String region =request.getParameter("txtRegion");
            String comuna =request.getParameter("txtComuna");
            String calle=request.getParameter("txtCalle");
            calle = StringUtils.replace(calle, "ñ", "n");
            calle= StringUtils.stripAccents(calle);
            int numeracion=Integer.parseInt(request.getParameter("txtNumber"));
            RegionChileExpress regionC= new RegionChileExpress();
            ComunaChileExpress comunaC= new ComunaChileExpress();
            CalleChileExpress calleC =new CalleChileExpress();
            NumeracionChileExpress num = new NumeracionChileExpress();
            //Region
            HashMap<String, RegionChileExpress> regiones = ChileExpress.ObtenerRegiones();
            Iterator it = regiones.entrySet().iterator();
            while (it.hasNext()) 
            {
                Map.Entry pair = (Map.Entry)it.next();
                if(pair.getKey().toString().equals(region))
                {
                    regionC= (RegionChileExpress) pair.getValue();
                }
                it.remove();
            }
            //Comuna
            HashMap<String, ComunaChileExpress> comunas = ChileExpress.Comunas(regionC.getRegionId());
            Iterator ot = comunas.entrySet().iterator();
            while (ot.hasNext()) 
            {
                Map.Entry pair = (Map.Entry)ot.next();
                if(pair.getKey().toString().equals(comuna))
                {
                    comunaC= (ComunaChileExpress) pair.getValue();
                }
                ot.remove();
            }
            //Calle
            calleC = ChileExpress.BuscarCalle(comunaC.getCountyName(), calle);
            if(calleC.getStreetId()==-100)
            {
                throw new Exception("Error en el ingreso de datos de la direccion");
            }
            //Direccion
            num = ChileExpress.Numeracion(calleC.getStreetId(),numeracion);
            if(num.getAddresId()==-100)
            {
                throw new Exception("Numeracion no encontrada");
            }
            HttpSession s= request.getSession();
            s.setAttribute("RegionResultado",regionC);
            s.setAttribute("ComunaResultado",comunaC);
            s.setAttribute("CalleResultado",calleC);
            s.setAttribute("DireccionnResultado",num);
            String direccion = regionC.getRegionName()+","+comunaC.getCountyName()+","+calleC.getStreetName()+","+num.getNumber();
            s.setAttribute("Resultado",true);
            s.setAttribute("direccionEnviame",direccion);
            response.sendRedirect("Paginas/Despacho.jsp");
        } catch(Exception e)
        {
            HttpSession s= request.getSession();
            s.setAttribute("errorDireccion",e.getMessage());
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
