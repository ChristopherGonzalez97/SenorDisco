<%-- 
    Document   : AgregarFamilia
    Created on : 23-10-2020, 12:46:25
    Author     : chris
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
            var nombreFamilia=document.forms["FormularioFamilia"]["txtFamilia"].value;
            
             if(nombreFamilia==0)
            {
                document.forms["FormularioFamilia"]["txtFamilia"].style.borderColor = "red";
                alert('Ingrese el nombre de la nueva familia');
                return false;
            }
        }
    </script>    
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
        %>
        <form action="../AgregarFamilia" method="POST" name="FormularioFamilia" onsubmit="return Validacion()">
            <table>
                <tr>
                    <td>
                        Nombre de la nueva familia
                    </td>
                    <td>
                        <input type="text" name="txtFamilia">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Agregar">
                    </td>
                    <td>
                        <input type="reset" value="Limpiar">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
