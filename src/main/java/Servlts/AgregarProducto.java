/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Fabricante;
import Clases.FamiliaProducto;
import Clases.Grupo;
import Clases.Imagen;
import Clases.ImagenPK;
import Clases.Marca;
import Clases.Producto;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "AgregarProducto", urlPatterns = {"/AgregarProducto"})
public class AgregarProducto extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String nombreProducto=request.getParameter("txtNombreProducto");
            String descripcion=request.getParameter("txtDescripcion");
            int precioVenta=Integer.parseInt(request.getParameter("txtPrecioVenta"));
            int precioCompra=Integer.parseInt(request.getParameter("txtPrecioCompra"));
            int stockInicial=Integer.parseInt(request.getParameter("txtStockInicial"));
            int precioVendedor=Integer.parseInt(request.getParameter("txtPrecioVendedor"));
            int precioDistribuidor=Integer.parseInt(request.getParameter("txtPrecioDistribuidor"));
            int stockCritico=Integer.parseInt(request.getParameter("txtStockCritico"));
            double peso=Double.parseDouble(request.getParameter("txtPeso"));
            int largo=Integer.parseInt(request.getParameter("txtLargo"));
            int ancho=Integer.parseInt(request.getParameter("txtAncho"));
            int alto=Integer.parseInt(request.getParameter("txtAlto"));
            int diametro=Integer.parseInt(request.getParameter("txtDiametro"));
            int familia=Integer.parseInt(request.getParameter("txtFamilia"));
            String fabricante=request.getParameter("txtFabricante");
            int idMarca = Integer.parseInt(request.getParameter("txtMarca"));
            int altoProducto= Integer.parseInt(request.getParameter("txtAltoProducto"));
            int anchoProducto= Integer.parseInt(request.getParameter("txtAnchoProducto"));
            int largoProducto= Integer.parseInt(request.getParameter("txtLargoProducto"));
            int posicion= Integer.parseInt(request.getParameter("txtPosicion"));
            
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
            
            Producto producto=new Producto();
            producto.setNombre(nombreProducto);
            producto.setStock(stockInicial);
            producto.setStockCritico(stockCritico);
            producto.setPeso(peso);
            producto.setDiametro(diametro);
            producto.setPrecioCompra(precioCompra);
            producto.setPrecioVenta(precioVenta);
            producto.setDescripcion(descripcion);
            producto.setDisponible(Short.parseShort("1"));
            producto.setAltura(alto);
            producto.setAncho(ancho);
            producto.setLargo(largo);
            producto.setPrecioDistribuidor(precioDistribuidor);
            producto.setPrecioVendedor(precioVendedor);
            producto.setAltoProducto(altoProducto);
            producto.setAnchoProducto(anchoProducto);
            producto.setLargoProducto(largoProducto);
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            
            if(request.getParameter("btnVideo").equals("on"))
            {
                String link = request.getParameter("txtVideo");
                producto.setVideo(link);
            }else
            {
                producto.setVideo("");
            }
            
             if(request.getParameter("btnGrupo")!=null)
            {
                int grupo = Integer.parseInt(request.getParameter("txtGrupo"));
                String talla = request.getParameter("txtTalla");
                producto.setTalla(talla);
                Grupo gr=em.find(Grupo.class, grupo);
                producto.setGrupoIdgrupo(gr);
            } 
            FamiliaProducto fp=em.find(FamiliaProducto.class, familia);
            Fabricante f= em.find(Fabricante.class, fabricante);
            
            producto.setFabricanteRut(f);
            producto.setFamiliaProductoIdfamiliaProducto(fp);
            
            int id =em.createNamedQuery("Producto.findAll").getResultList().size()+1; 
            
            int idImg =em.createNamedQuery("Imagen.findAll").getResultList().size()+1;
           
            Marca marca= em.find(Marca.class,idMarca);
            
            Imagen img=new Imagen();
            ImagenPK imgPK =  new ImagenPK();
            imgPK.setProductoIdproducto(id);
            imgPK.setIdimagen(idImg);
            img.setImagen(picInBytes);
            img.setImagenPK(imgPK);
            img.setHabilitado(Short.parseShort("1"));
            img.setPosicion(posicion);
            List<Imagen> imagenes= new ArrayList();
            imagenes.add(img);
            
            producto.setIdproducto(id);
            producto.setImagenList(imagenes);
            producto.setMarcaidMarca(marca);
            
            em.getTransaction().begin();
            em.persist(img);
            em.persist(producto);
            em.getTransaction().commit();
            
            HttpSession s = request.getSession();          
            s.setAttribute("MensajePagina", "Producto agregado correctamente <br> redireccionando...");
            s.setAttribute("url", "../Employees/Productos.jsp");
            response.sendRedirect("Paginas/Mensaje.jsp");
        }
        catch(Exception e)
        {
            HttpSession s = request.getSession();          
            s.setAttribute("errorMessage",e.getMessage());
            response.sendRedirect("Paginas/AgregarProducto.jsp");
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
