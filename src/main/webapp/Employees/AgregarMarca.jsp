<%-- 
    Document   : AgregarMarca
    Created on : 19-03-2021, 17:38:04
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
            var nombre=document.forms["FormularioMarca"]["txtNombre"].value;
            var marca=document.forms["FormularioMarca"]["flImagen"].value;
            
            if(nombre==0)
            {
                document.forms["FormularioMarca"]["txtNombre"].style.borderColor = "red";
                alert('Ingrese el nombre de la marca');
                return false;
            }
            if(marca==0)
            {
                document.forms["FormularioMarca"]["flImagen"].style.borderColor = "red";
                alert('Ingrese el logo de la marca');
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
        <form class="register-form" action="../AgregarMarca" onsubmit="return Validacion()" name="FormularioMarca"  method="Post" enctype="multipart/form-data">
            <table>
            <tr>
                <td>
                    Nombre de marca
                </td>
                <td>
                    <input type="text" name="txtNombre">
                </td>
            </tr>
            <tr>
                <td>
                    Imagen marca
                </td>
                <td>
                    <input type="file" name="flImagen">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="Agregar">
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
