/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import cl.transbank.webpay.exception.TransactionCommitException;
import cl.transbank.webpay.webpayplus.WebpayPlus;
import cl.transbank.webpay.webpayplus.model.WebpayPlusTransactionCommitResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chris
 */
@WebServlet(name = "RespuestaWebPay", urlPatterns = {"/RespuestaWebPay"})
public class RespuestaWebPay extends HttpServlet {

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
            throws ServletException, IOException, TransactionCommitException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
            String token=request.getParameter("token_ws");
            String token1=request.getParameter("TBK_TOKEN");
            String token2=request.getParameter("TBK_ID_SESION");
            String token3=request.getParameter("TBK_ORDEN_COMPRA");
            WebpayPlusTransactionCommitResponse  responses = WebpayPlus.Transaction.commit(token);
            String id= responses.getSessionId();
            String direccion="";
            Cookie cookie = new Cookie("JSESSIONID", id);
            response.addCookie(cookie);
            if(responses.getStatus().equals("AUTHORIZED"))
            {
                direccion="GenerarEnvio?=id";
            }
            else if(responses.getStatus().equals("FAILED")){
                throw new Exception("Transaccion Fallida");
            }
            int metPago=0;
            if(responses.getPaymentTypeCode().equals("VD"))
            {
                metPago=0;
            }
            else if(responses.getPaymentTypeCode().equals("VN")){
                metPago=1;
            }
            else if(responses.getPaymentTypeCode().equals("VC")){
                 metPago=2;
            }
            else if(responses.getPaymentTypeCode().equals("SI")){
                 metPago=3;
            }
            else if(responses.getPaymentTypeCode().equals("S2")){
                metPago=4;
            }
            else if(responses.getPaymentTypeCode().equals("Vp")){
                metPago=5;
            }
            else{
                 metPago=6;
            }
            direccion=direccion+metPago;
            response.sendRedirect(direccion);
        }
        catch(Exception e)
        {
            response.sendRedirect("Paginas/TransaccionDenegada.jsp");
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
        try {
            processRequest(request, response);
        } catch (TransactionCommitException ex) {
            Logger.getLogger(RespuestaWebPay.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (TransactionCommitException ex) {
            Logger.getLogger(RespuestaWebPay.class.getName()).log(Level.SEVERE, null, ex);
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
