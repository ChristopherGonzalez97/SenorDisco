<%-- 
    Document   : Label
    Created on : 10-01-2021, 16:31:54
    Author     : pc
--%>

<%@page import="Clases.Cliente"%>
<%@page import="Clases.Bulto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="Clases.Despacho"%>
<%@page import="Clases.Venta"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="Despacho.Response"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
            String id = posiciones[1];
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            Venta venta=(Venta) em.createNamedQuery("Venta.findByIdventa").setParameter("idventa", Integer.parseInt(id)).getSingleResult();
            Despacho des = venta.getDespachoList().get(0);
            List<Bulto> bultos = new ArrayList<Bulto>();
            bultos=des.getBultoList();
        %>
        <h1>
            Guia despacho 
        </h1>
        <%
            for(Bulto bulto:bultos)
            {
                  String urlq = new String(bulto.getEtiqueta());
        %>     
        Etiqueta : <a href="<%=urlq%>")>Etiquetas </a>
          
                
            <%}
        %>
        
    </body>
</html>
