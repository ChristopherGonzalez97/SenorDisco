<%-- 
    Document   : AgregarGrupo
    Created on : 18-03-2021, 18:23:54
    Author     : pc
--%>

<%@page import="Clases.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script type="text/javascript">
        function Validacion()
        {
            var nombre = document.forms["FormularioProducto"]["txtNombre"].value;
            var despliegue = document.forms["FormularioProducto"]["txtNombreDesplegar"].value;
            
             if(nombre==0)
            {
                document.forms["FormularioProducto"]["txtNombre"].style.borderColor = "red";
                alert('Ingrese el nombre del Grupo');
                return false;
            }
            if(despliegue==0)
            {
                document.forms["FormularioProducto"]["txtNombreDesplegar"].style.borderColor = "red";
                alert('Ingrese el nombre del producto');
                return false;
            }
            
        }
    </script>
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
    %>
    <body>
        <form action="../AgregarGrupo" method="POST" onsubmit="return Validacion()" name="FormularioProducto">
            <table>
                <tr>
                    <td>
                        Agregar grupo
                    </td>                  
                </tr>
                <tr>
                    <td>
                        Nombre
                    </td>
                    <td>
                        <input type="text" name="txtNombre">
                    </td>
                </tr>
                <tr>
                    <td>
                        Nombre a desplegar
                    </td>
                    <td>
                        <input type="text" name="txtNombreDesplegar">
                    </td>
                </tr>
                <tr>
                    <td>
                         <input type="submit" value="Ingresar">
                    </td>              
                </tr>
            </table>
            
        </form>
    </body>
</html>
