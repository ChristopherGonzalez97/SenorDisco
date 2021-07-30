/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;


import Clases.Venta;
import flexjson.transformer.Transformer;
import gui.ava.html.image.generator.HtmlImageGenerator;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.image.BufferedImage;
import static java.awt.image.ImageObserver.HEIGHT;
import static java.awt.image.ImageObserver.WIDTH;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.net.URL;
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
import javax.swing.JScrollPane;
import javax.swing.border.Border;
import javax.swing.text.html.HTMLEditorKit;
import javax.swing.text.html.StyleSheet;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

/**
 *
 * @author pc
 */
@WebServlet(name = "BoletaJava", urlPatterns = {"/BoletaJava"})
public class BoletaJava extends HttpServlet {

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
            String urlo = request.getQueryString();
            String[] posiciones = urlo.split("=");
            String id = posiciones[1];
            HTMLEditorKit messageEditorPaneHTMLEditorKit  = new HTMLEditorKit();
            StyleSheet styleSheet = new StyleSheet();
            URL u=new URL("http://localhost:8080/AppDiscos/web/css/boleta.css");
            styleSheet.importStyleSheet(u);
            messageEditorPaneHTMLEditorKit.setStyleSheet(styleSheet);
            String urls ="http://localhost:8080/AppDiscos/Paginas/Boleta.jsp?id="+id;
            URL url = new URL(urls);

            JEditorPane editorPane = new JEditorPane();
            editorPane.setEditable(false);
            editorPane.setPage(url);
            editorPane.setSize(1200, 800);
            
            BufferedImage renderedImage = new Robot().createScreenCapture(new Rectangle(1200, 800));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne1.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne2.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne3.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne1.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne2.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne3.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne1.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne2.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne3.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne1.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne2.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne3.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne1.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne2.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne3.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne1.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne2.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne3.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne1.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne2.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne3.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne1.png"));
            editorPane.print(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne2.png"));
            editorPane.printAll(renderedImage.getGraphics());
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne3.png"));

     
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(renderedImage, "jpg", baos);
            byte[] bytes = baos.toByteArray();
            
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            Venta venta=(Venta) em.createNamedQuery("Venta.findByIdventa").setParameter("idventa", Integer.parseInt(id)).getSingleResult();
            venta.setBoletaGenerada(bytes);
            em.getTransaction().begin();
            em.merge(venta);
            em.getTransaction().commit();
            response.sendRedirect("Paginas/Voucher.jsp");
            
        }catch(Exception e)
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
