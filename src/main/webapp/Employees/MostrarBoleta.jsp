<%-- 
    Document   : MostrarBoleta
    Created on : 22-01-2021, 18:55:40
    Author     : pc
--%>

<%@page import="java.util.Base64"%>
<%@page import="Clases.Cliente"%>
<%@page import="Clases.Venta"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        HttpSession s = request.getSession();
            try{
                if(s.getAttribute("Usuario")==null)
                {
                    throw new Exception();
                }
                else{
                   Cliente cli =(Cliente) s.getAttribute("Usuario");
                    if(!cli.getUsuarioIdusuario().Role())
                    {
                        throw new Exception();
                    }
                }
            }catch(Exception e)
            {
                response.sendRedirect("../Errors/Error403.jsp");
            }
         String url = request.getQueryString();
         String[] posiciones = url.split("=");
         String ido = posiciones[1];
         int id= Integer.parseInt(ido);
         EntityManagerFactory emf ;
         emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
         EntityManager em = emf.createEntityManager();
         Venta venta = new Venta();
         venta= em.createNamedQuery("Venta.findByIdventa",Venta.class).setParameter("idventa", id).getSingleResult();
    %>
    <body>
        
       <div class="col-lg-4 col-md-6 col-sm-6 product-men women_two">
            <div class="product-toys-info">
               <div class="men-pro-item">
                  <div class="men-thumb-item">
                     <img src="<%      
                         String ul = "data:image/png;base64,";
                         String n=new String(venta.getBoletaGenerada());
                         out.print(n);
                                    %>" class="img-thumbnail img-fluid" alt="">
                  </div>
               </div>
            </div>
     </div>
    </body>
</html>
