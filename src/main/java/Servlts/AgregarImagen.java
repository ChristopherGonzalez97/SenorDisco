/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Imagen;
import Clases.ImagenPK;
import Clases.Producto;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author chris
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet(name = "AgregarImagen", urlPatterns = {"/AgregarImagen"})
public class AgregarImagen extends HttpServlet {

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
            
            int id = Integer.parseInt(request.getParameter("txtId"));
            
            InputStream imagen = null;
            Part filePart = request.getPart("flImagen");

            if (filePart !=null) 
            {
                if (filePart.getContentType().contains("image")) 
                {
                    imagen = filePart.getInputStream();
                }
            }
            
            byte[] picInBytes =new byte[(int)filePart.getSize()];
            imagen.read(picInBytes);
            
            ImagenPK imagepk=new ImagenPK();
            Imagen image= new Imagen();
            image.setHabilitado(Short.parseShort("1"));
            image.setImagen(picInBytes);
            int posicion = Integer.parseInt(request.getParameter("txtPosicion"));
            image.setPosicion(posicion);
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            Producto pro = em.find(Producto.class, id);
            
            int idImagen= em.createNamedQuery("Imagen.findAll").getResultList().size()+1; 
            
            imagepk.setIdimagen(idImagen);
            imagepk.setProductoIdproducto(pro.getIdproducto());
            
            image.setImagenPK(imagepk);
            image.setProducto(pro);
            List<Imagen> imagenes= pro.getImagenList();
            imagenes.add(image);
            
            pro.setImagenList(imagenes);
            
            em.getTransaction().begin();
            em.persist(image);
            em.merge(pro);
            em.getTransaction().commit();
            
            HttpSession s=request.getSession();
              String urls= "../Employees/AdministrarImagenes.jsp?id="+pro.getIdproducto();
            s.setAttribute("MensajePagina", "Imagen agregada...");
            s.setAttribute("url", urls);
            response.sendRedirect("Paginas/Mensaje.jsp");
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
