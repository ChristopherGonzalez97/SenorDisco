<%-- 
    Document   : Garantia
    Created on : 28-01-2021, 12:51:36
    Author     : pc
--%>

<%@page import="Clases.Cliente"%>
<%@page import="Clases.DetalleVenta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
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
        String id = posiciones[1];
        
        EntityManagerFactory emf ;
        emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
        EntityManager em = emf.createEntityManager();
        
        Venta venta =(Venta) em.createNamedQuery("Venta.findByIdventa").setParameter("idventa",Integer.parseInt(id)).getSingleResult();
        List<DetalleVenta> lista = venta.getDetalleVentaList();
    %>
    <body>
        <table>
            <tr>
                <td>
                    Seleccione los productos que seran enviados
                </td>
            </tr>
        <%
            int rastrear=0;
            for(DetalleVenta dt:lista)
            {%>   
            <tr>
                <td>
                    <%out.println(dt.getProducto().getNombre()); %>
                </td>
                <td>
                    <input type="checkbox" name="txtProducto<%=rastrear%>">
                </td>
            </tr>
            <%
                rastrear++;
            }
        %>
        <tr>
            <td>
                <button>
                    Generar orden de envio
                </button>
            </td>
        </tr>
         </table>
    </body>
</html>
